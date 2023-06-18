//
//  PopularMoviesApp.swift
//  PopularMovies
//
//  Created by Pradeep Gianchandani on 18/06/23.
//

import SwiftUI

@main
struct PopularMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            let apiService = MovieAPIService()
            let movieRepository = MovieDataRepository(apiService: apiService)
            let viewModel = MovieListViewModel(movieRepository: movieRepository)
            MovieListView(movieListViewModel: viewModel)
        }
    }
}
