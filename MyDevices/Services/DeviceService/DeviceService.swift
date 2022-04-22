//
//  DevicesService.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation
import Combine

protocol DeviceServiceProtocol {
    func details(for deviceId: String) -> AnyPublisher<Device, Error>
    func search(for term: String) -> AnyPublisher<[Device], Error>
    func list() -> AnyPublisher<[Device], Error>
    func toggleFavorite(deviceId: String) -> AnyPublisher<Void, Error>
}

final class DeviceService: DeviceServiceProtocol {
    func details(for deviceId: String) -> AnyPublisher<Device, Error> {
        if let device = MockDeviceData.devices.first(where: { $0.id == deviceId }) {
            return Just(device)
                .setFailureType(to: Error.self)
                .receive(on: DispatchQueue.main)
                .delay(for: 2, scheduler: RunLoop.main)
                .eraseToAnyPublisher()
        } else {
            fatalError()
        }
    }
    
    func search(for term: String) -> AnyPublisher<[Device], Error> {
        let devices = MockDeviceData.devices
            .filter({ "\($0.brand) \($0.model)".contains(term) })
        return Just(devices)
            .setFailureType(to: Error.self)
            .receive(on: DispatchQueue.main)
            .delay(for: 2, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func list() -> AnyPublisher<[Device], Error> {
        let devices = MockDeviceData.devices
        return Just(devices)
            .setFailureType(to: Error.self)
            .receive(on: DispatchQueue.main)
            .delay(for: 2, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func toggleFavorite(deviceId: String) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            if let index = MockDeviceData.devices.firstIndex(where: { $0.id == deviceId }) {
                var temp = MockDeviceData.devices[index]
                temp.isFavorite.toggle()
                MockDeviceData.devices[index] = temp
            }
            promise(.success(()))
        }.eraseToAnyPublisher()
    }
}
