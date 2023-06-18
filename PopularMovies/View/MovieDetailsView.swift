//
//  MovieDetailsView.swift
//  PopularMovies
//
//  Created by Pradeep Gianchandani on 18/06/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            Text(movie.title)
                .font(.largeTitle)
                .padding()
            
            if let imageURL = movie.posterURL {
                WebImage(url: imageURL)
                    .resizable()
                    .placeholder(Image(systemName: "photo"))
                    .indicator(.activity)
                    .scaledToFit()
                    .padding()
            }
            
            Text(movie.overview)
                .font(.body)
                .padding()
            
            Spacer()
        }
    }
}


