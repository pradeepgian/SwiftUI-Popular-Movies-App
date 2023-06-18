//
//  MovieRepository.swift
//  PopularMovies
//
//  Created by Pradeep Gianchandani on 18/06/23.
//

import Foundation
import Combine

protocol MovieRepository {
    func fetchPopularMovies() -> AnyPublisher<[Movie], Error>
}

class MovieDataRepository: MovieRepository {
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchPopularMovies() -> AnyPublisher<[Movie], Error> {
        let endpoint = APIEndpoint.popularMovies
        return apiService.request(endpoint: endpoint)
            .map { (response: MovieListResponse) -> [Movie] in
                return Array(response.results.prefix(10))
            }
            .eraseToAnyPublisher()
    }
}
