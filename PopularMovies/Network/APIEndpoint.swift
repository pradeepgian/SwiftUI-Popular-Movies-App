//
//  APIEndpoint.swift
//  PopularMovies
//
//  Created by Pradeep Gianchandani on 18/06/23.
//

import Foundation

enum APIEndpoint {
    case popularMovies
}

extension APIEndpoint: EndPoint {
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var host: String {
        return "api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .popularMovies:
            return "/3/movie/popular"
        }
    }
    
    private var apiKey: String {
        return "6101e5943947ba908536f56f0453d769"
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .popularMovies:
            return .get
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .popularMovies:
            return ["api_key": apiKey, "limit": "10"]
        }
    }
}

protocol EndPoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: [String: String] { get }
}

enum HTTPMethod : String {
    case get     = "GET"
    case post    = "POST"
}

