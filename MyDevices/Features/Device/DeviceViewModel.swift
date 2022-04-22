//
//  DeviceViewModel.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation
import Combine

protocol DeviceViewModelProtocol: ObservableObject {
    var title                   : String    { get }
    var status                  : String    { get }
    var imageURL                : URL?      { get }
    var favoriteIcon            : String    { get }
    var os                      : String    { get }
    var screenResolution        : String    { get }
    var isLoading               : Bool      { get }
    var fullStars               : Int       { get }
    var halfStars               : Int       { get }
    var emptyStars              : Int       { get }
    
    func toggleFavorite()
}

final class DeviceViewModel: DeviceViewModelProtocol, Identifiable {
    @Published private(set) var device: Device?
    @Published private(set) var isLoading: Bool = false
    
    private let deviceService: DeviceServiceProtocol
    
    private var cancellables: [AnyCancellable] = [AnyCancellable]()
    
    init(deviceId: String, deviceService: DeviceServiceProtocol = DeviceService()) {
        self.deviceService = deviceService
        
        getMovieDetails(deviceId: deviceId)
    }
    
    var id: String {
        device?.id ?? ""
    }
    
    var title: String {
        "\(device?.brand ?? "") \(device?.model ?? "")"
    }
    
    var status: String {
        device?.status.rawValue ?? ""
    }
    
    var imageURL: URL? {
        URL(string: device?.imageURL ?? "")
    }
    
    var favoriteIcon: String {
        (device?.isFavorite ?? false) ? "star.fill" : "star"
    }
    
    var os: String {
        device?.os ?? ""
    }
    
    var screenResolution: String {
        device?.screenResolution ?? ""
    }
    
    var fullStars: Int {
        Int(device?.stars ?? 0)
    }
    
    var halfStars: Int {
        Int(ceil(modf(device?.stars ?? 0).1))
    }
    
    var emptyStars: Int {
        Int(5 - (device?.stars ?? 0))
    }
    
    func toggleFavorite() {
        if let deviceId = device?.id {
            self.deviceService.toggleFavorite(deviceId: deviceId)
                .sink { [unowned self] completition in
                    self.getMovieDetails(deviceId: deviceId)
                } receiveValue: { _ in
                    print ("success")
                }.store(in: &cancellables)
        }
    }
    
    private func getMovieDetails(deviceId: String) {
        isLoading = true
        self.deviceService.details(for: deviceId)
            .sink { [unowned self] completition in
                self.isLoading = false
            } receiveValue: { [unowned self] device in
                self.device = device
            }.store(in: &cancellables)
    }
}
