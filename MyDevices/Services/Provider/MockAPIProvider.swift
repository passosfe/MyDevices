//
//  MockAPIProvider.swift
//  MyDevices
//
//  Created by Felipe Passos on 24/04/22.
//

import Foundation
import Combine

struct MockAPIProvider: APIProvider {
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
        
        let absoluteString = request.url?.absoluteString
        let jsonEncoder = JSONEncoder()
        var data: Data? = "".data(using: .utf8)!
        
        if absoluteString?.contains("/devicesFavourite/") ?? false {
            if let range = absoluteString?.range(of: "/devicesFavourite/") {
                let deviceId = absoluteString?[range.upperBound...]
                if let index = MockDeviceData.devices.firstIndex(where: { $0.id == deviceId ?? "" }) {
                    var temp = MockDeviceData.devices[index]
                    temp.isFavorite.toggle()
                    MockDeviceData.devices[index] = temp
                    
                    return Just((data: "".data(using: .utf8)!, response: response))
                        .setFailureType(to: URLError.self)
                        .eraseToAnyPublisher()
                }
            }
        } else if absoluteString?.contains("/deviceDetails/") ?? false {
            if let range = absoluteString?.range(of: "/deviceDetails/") {
                let deviceId = absoluteString?[range.upperBound...]
                
                if let device = MockDeviceData.devices.first(where: { $0.id == deviceId ?? "" }) {
                    do {
                        let jsonData = try jsonEncoder.encode(device)
                        let string = String(data: jsonData, encoding: String.Encoding.utf8)
                        data = string?.data(using: .utf8)!
                    } catch {
                        print("error")
                    }
                }
            }
        } else if absoluteString?.contains("/search/") ?? false {
            if let range = absoluteString?.range(of: "/search/") {
                let term = absoluteString?[range.upperBound...]
                
                let devices = MockDeviceData.devices
                    .filter({ "\($0.brand) \($0.model)".lowercased().contains(term?.lowercased() ?? "") })
                
                do {
                    let jsonData = try jsonEncoder.encode(devices)
                    let string = String(data: jsonData, encoding: String.Encoding.utf8)
                    data = string?.data(using: .utf8)!
                } catch {
                    print("error")
                }
            }
        } else {
            let devices = MockDeviceData.devices
            
            do {
                let jsonData = try jsonEncoder.encode(devices)
                let string = String(data: jsonData, encoding: String.Encoding.utf8)
                data = string?.data(using: .utf8)!
            } catch {
                print("error")
            }
        }
        
        
        return Just((data: data!, response: response))
            .setFailureType(to: URLError.self)
            .delay(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
