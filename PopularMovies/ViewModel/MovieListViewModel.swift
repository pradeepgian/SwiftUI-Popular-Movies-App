//
//  MovieListViewModel.swift
//  PopularMovies
//
//  Created by Pradeep Gianchandani on 18/06/23.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var error: APIError?
    
    private let movieRepository: MovieRepository
    private var cancellables: Set<AnyCancellable> = []
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func fetchPopularMovies() {
        movieRepository.fetchPopularMovies()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    self.error = error as? APIError
                }
            } receiveValue: { movies in
                self.movies = movies
            }
            .store(in: &cancellables)
    }
}
