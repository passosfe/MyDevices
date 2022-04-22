//
//  HomeViewModel.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation
import Combine

protocol HomeViewModelProtocol: ObservableObject {
    var devices                     : [Device]  { get }
    var isLoading                   : Bool      { get }
    var searchText                  : String    { get set }
    var searchResultsAmmount        : String    { get }
    var isSearching                 : Bool      { get }
}

final class HomeViewModel: HomeViewModelProtocol {
    // MARK: - Typealias
        
    private typealias Time = HomeConstants.Time
    private typealias Strings = HomeConstants.Strings
    
    //MARK: - Properties
    
    @Published private(set) var devices: [Device] = MockDeviceData.temporaryData
    @Published private(set) var isLoading: Bool = false
    @Published var searchText: String = ""
    @Published var isSearching: Bool = false
    
    private let deviceService: DeviceServiceProtocol
    
    private var cancellables: [AnyCancellable] = [AnyCancellable]()
    private var searchCancellable: AnyCancellable?
    
    init(deviceService: DeviceServiceProtocol = DeviceService()) {
        self.deviceService = deviceService
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: Time.debounce, scheduler: RunLoop.main)
            .sink(receiveValue: { [unowned self] str in
                if str.count > 0 {
                    self.devices = []
                }
                
                self.searchDevices(text: str)
            })
    }
    
    var searchResultsAmmount: String {
        Strings.resultsAmmount.replacingOccurrences(of: Strings.resultsAmmountPlaceholder, with: String(devices.count))
    }
    
    private func searchDevices(text: String) {
        isLoading = true
        isSearching = text.count > 0 ? true : false
        let publisher = text.count > 0 ? self.deviceService.search(for: text) : self.deviceService.list()
        publisher
            .sink { [unowned self] completition in
                self.isLoading = false
            } receiveValue: { [unowned self] devices in
                self.devices = devices
            }.store(in: &cancellables)
    }
}
