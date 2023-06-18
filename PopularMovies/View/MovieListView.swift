//
//  MovieListView.swift
//  PopularMovies
//
//  Created by Pradeep Gianchandani on 18/06/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieListView: View {
    
    @State private var selectedMovie: Movie? = nil
    @ObservedObject var movieListViewModel: MovieListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if movieListViewModel.movies.isEmpty {
                    ProgressView()
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(movieListViewModel.movies, id: \.self) { movie in
                                if let imageUrl = movie.posterURL {
                                    Button(action: {
                                        selectedMovie = movie
                                    }) {
                                        WebImage(url: imageUrl)
                                            .resizable()
                                            .placeholder(Image(systemName: "photo"))
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            .cornerRadius(10)
                                            .padding(.all, 10)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Popular Movies")
            .sheet(item: $selectedMovie) { movie in
                MovieDetailsView(movie: movie)
            }
            .onAppear {
                movieListViewModel.fetchPopularMovies()
            }
            .alert(item: $movieListViewModel.error) { error in
                Alert(title: Text("Error"), message: Text(error.localizedDescription), dismissButton: .default(Text("OK")))
            }
        }
    }
}


