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
    func toggleFavorite(deviceId: String) -> AnyPublisher<String, Error>
}

final class DeviceService: DeviceServiceProtocol {
    let agent = MockAgent()
    
    func details(for deviceId: String) -> AnyPublisher<Device, Error> {
        return agent.run(DevicesAPI.getDetails(deviceId).urlRequest)
            .map(\.value)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func search(for term: String) -> AnyPublisher<[Device], Error> {
        return agent.run(DevicesAPI.search(term).urlRequest)
            .map(\.value)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func list() -> AnyPublisher<[Device], Error> {
        return agent.run(DevicesAPI.getDevices.urlRequest)
            .map(\.value)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func toggleFavorite(deviceId: String) -> AnyPublisher<String, Error> {
        return agent.run(DevicesAPI.toggleFavourite(deviceId).urlRequest)
            .map(\.value)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
//        return Future<Void, Error> { promise in
//
//            promise(.success(()))
//        }.eraseToAnyPublisher()
    }
}
