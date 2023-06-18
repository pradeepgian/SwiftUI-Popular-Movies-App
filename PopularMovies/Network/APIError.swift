//
//  APIError.swift
//  PopularMovies
//
//  Created by Pradeep Gianchandani on 18/06/23.
//

import Foundation

enum APIError: Error, Identifiable {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    var id: String {
        switch self {
        case .invalidURL:
            return "InvalidURL"
        case .invalidResponse:
            return "InvalidResponse"
        case .statusCode(let statusCode):
            return "StatusCode\(statusCode)"
        }
    }
}
