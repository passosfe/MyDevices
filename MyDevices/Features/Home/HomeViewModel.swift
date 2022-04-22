//
//  HomeViewModel.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation
import Combine

protocol HomeViewModelProtocol: ObservableObject {
    var devices         : [Device]  { get }
    var isLoading       : Bool      { get }
    var searchText      : String    { get set }
}

final class HomeViewModel: HomeViewModelProtocol {
    @Published private(set) var devices: [Device] = []
    @Published private(set) var isLoading: Bool = false
    @Published var searchText: String = ""
    
    private let deviceService: DeviceServiceProtocol
    
    private var cancellables: [AnyCancellable] = [AnyCancellable]()
    private var searchCancellable: AnyCancellable?
    
    init(deviceService: DeviceServiceProtocol = DeviceService()) {
        self.deviceService = deviceService
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { [unowned self] str in
                self.searchDevices(text: str)
            })
        
        searchDevices(text: searchText)
    }
    
    private func searchDevices(text: String) {
        isLoading = true
        let publisher = text.count > 0 ? self.deviceService.search(for: text) : self.deviceService.list()
        publisher
            .sink { [unowned self] completition in
                self.isLoading = false
            } receiveValue: { [unowned self] devices in
                self.devices = devices
            }.store(in: &cancellables)
    }
}
