//
//  DevicesService.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation
import Combine

protocol DevicesServiceProtocol {
    func details(for deviceId: String) -> AnyPublisher<Device, APIError>
    func search(for term: String) -> AnyPublisher<SearchResponse, APIError>
}

final class DevicesService: DevicesServiceProtocol {
    let agent = Agent()
    
    func list(category: MovieAPI.MovieCategories, page: Int) -> AnyPublisher<ListResponse<Movie>, APIError> {
        return agent.run(MovieAPI.getMovies(category, page).urlRequest)
            .mapError { _ in APIError.unknown }
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func details(for movieId: Int) -> AnyPublisher<Movie, APIError> {
        return agent.run(MovieAPI.getDetails(movieId).urlRequest)
            .mapError { _ in APIError.unknown }
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func cast(for movieId: Int) -> AnyPublisher<CastResponse, APIError> {
        return agent.run(MovieAPI.getCast(movieId).urlRequest)
            .mapError { _ in APIError.unknown }
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func search(for term: String, page: Int) -> AnyPublisher<SearchResponse, APIError> {
        return agent.run(MovieAPI.search(term, page).urlRequest)
            .mapError { _ in APIError.unknown }
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
