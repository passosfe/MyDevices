//
//  Endpoints.swift
//  MyDevices
//
//  Created by Felipe Passos on 24/04/22.
//


import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
}

enum DevicesAPI {
    case getDevices
    case getDetails(String)
    case search(String)
    case toggleFavourite(String)
}

extension DevicesAPI: APIBuilder {
    var urlRequest: URLRequest {
        let components: URLComponents = URLComponents(url: self.baseURL.appendingPathComponent(self.path), resolvingAgainstBaseURL: true)!
        return URLRequest(url: components.url!)
    }
    
    var baseURL: URL {
        URL(string: "https://api.devices.com")!
    }
    
    var path: String {
        switch self {
        case .getDevices:
            return "/alldevices"
        case .getDetails(let deviceId):
            return "/deviceDetails/\(deviceId)"
        case .toggleFavourite(let deviceId):
            return "/devicesFavourite/\(deviceId)"
        case .search(let term):
            return "/search/\(term)"
        }
    }
}
