//
//  APIProvider.swift
//  MyDevices
//
//  Created by Felipe Passos on 24/04/22.
//

import Foundation
import Combine

protocol APIProvider {
    typealias APIResponse = URLSession.DataTaskPublisher.Output
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError>
}

extension URLSession: APIProvider {
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        return dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}
