//
//  Movie.swift
//  PopularMovies
//
//  Created by Pradeep Gianchandani on 18/06/23.
//

import Foundation

struct Movie: Decodable, Hashable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let imageBaseUrl = "https://image.tmdb.org/t/p/original/"
    
    private enum CodingKeys: String, CodingKey {
        case id, title, overview, posterPath = "poster_path"
    }
    
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        let urlString = imageBaseUrl + posterPath
        return URL(string: urlString)
    }
}

struct MovieListResponse: Decodable {
    let results: [Movie]
}
