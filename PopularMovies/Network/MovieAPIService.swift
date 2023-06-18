//
//  MovieAPIService.swift
//  PopularMovies
//
//  Created by Pradeep Gianchandani on 18/06/23.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(endpoint: APIEndpoint) -> AnyPublisher<T, Error>
}

class MovieAPIService: APIService {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(endpoint: APIEndpoint) -> AnyPublisher<T, Error> {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        components.setQueryItems(endpoint.parameters)
        guard let url = components.url else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                guard 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.statusCode(httpResponse.statusCode)
                }
                
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

