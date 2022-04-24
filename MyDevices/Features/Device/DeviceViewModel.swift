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
    var isLoadingFavourite      : Bool      { get }
    var starIcons               : [String]  { get }
    
    func toggleFavorite()
}

final class DeviceViewModel: DeviceViewModelProtocol, Identifiable {
    // MARK: - Typealias

    private typealias ImageNames = DeviceConstants.ImageNames
    
    //MARK: - Properties
    
    @Published private(set) var device: Device?
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var isLoadingFavourite: Bool = false
    
    private let deviceService: DeviceServiceProtocol
    
    private var cancellables: [AnyCancellable] = [AnyCancellable]()
    
    init(deviceId: String, deviceService: DeviceServiceProtocol = DeviceService()) {
        self.deviceService = deviceService
        
        // Note: Only reason to get the device from the API in this case is to keep the the favourite flag updated, otherwise it could be passed as a property
        getDeviceDetails(deviceId: deviceId)
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
        (device?.isFavorite ?? false) ? ImageNames.fullStar : ImageNames.emptyStar
    }
    
    var os: String {
        device?.os ?? ""
    }
    
    var screenResolution: String {
        device?.screenResolution ?? ""
    }
    
    var starIcons : [String] {
        var stars = [String]()
        
        for _ in 0..<fullStars {
            stars.append(ImageNames.fullStar)
        }
        
        for _ in 0..<halfStars {
            stars.append(ImageNames.halfStar)
        }
        
        for _ in 0..<emptyStars {
            stars.append(ImageNames.emptyStar)
        }
        
        return stars
    }
    
    func toggleFavorite() {
        self.isLoadingFavourite = true
        if let deviceId = device?.id {
            self.deviceService.toggleFavorite(deviceId: deviceId)
            .sink { [unowned self] completition in
                self.deviceService.details(for: deviceId)
                    .sink { [unowned self] completition in
                        self.isLoadingFavourite = false
                    } receiveValue: { device in
                        self.device = device
                    }.store(in: &cancellables)
                
            } receiveValue: { _ in }.store(in: &cancellables)
        }
    }
    
    // MARK: - Private Properties
    
    private var fullStars: Int {
        Int(modf(device?.stars ?? 0).0)
    }
    
    private var halfStars: Int {
        Int(ceil(modf(device?.stars ?? 0).1))
    }
    
    private var emptyStars: Int {
        Int(5 - modf(ceil(device?.stars ?? 0)).0)
    }
    
    private func getDeviceDetails(deviceId: String) {
        isLoading = true
        self.deviceService.details(for: deviceId)
            .sink { [unowned self] completition in
                self.isLoading = false
            } receiveValue: { [unowned self] device in
                self.device = device
            }.store(in: &cancellables)
    }
}
