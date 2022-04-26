//
//  DeviceServiceMock.swift
//  MyDevicesTests
//
//  Created by Felipe Passos on 23/04/22.
//

import Foundation
import Combine
@testable import MyDevices

final class DeviceServiceMock: DeviceServiceProtocol {
    
    var devices = [Device]()
    
    func details(for deviceId: String) -> AnyPublisher<Device, Error> {
        if let device = devices.first(where: { $0.id == deviceId }) {
            return Just(device)
                .setFailureType(to: Error.self)
                .receive(on: DispatchQueue.global())
                .delay(for: 0.5, scheduler: RunLoop.main)
                .eraseToAnyPublisher()
        } else {
            fatalError()
        }
    }
    
    func search(for term: String) -> AnyPublisher<[Device], Error> {
        let devices = devices
            .filter({ "\($0.brand) \($0.model)".lowercased().contains(term.lowercased()) })
        return Just(devices)
            .setFailureType(to: Error.self)
            .receive(on: DispatchQueue.global())
            .delay(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func list() -> AnyPublisher<[Device], Error> {
        let devices = devices
        return Just(devices)
            .setFailureType(to: Error.self)
            .receive(on: DispatchQueue.global())
            .delay(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func toggleFavorite(deviceId: String) -> AnyPublisher<String, Error> {
        if let index = self.devices.firstIndex(where: { $0.id == deviceId }) {
            var temp = self.devices[index]
            temp.isFavorite.toggle()
            self.devices[index] = temp
        }
        
        return Just("")
            .setFailureType(to: Error.self)
            .receive(on: DispatchQueue.global())
            .delay(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
