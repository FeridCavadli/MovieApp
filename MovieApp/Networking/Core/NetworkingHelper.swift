//
//  NetworkingHelper.swift
//  MovieApp
//
//  Created by Ferid on 02.12.25.
//

import Foundation
import Alamofire

class NetworkingHelper {
    static let shared = NetworkingHelper()

    private init () {
    }

    let headers: HTTPHeaders = ["Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNjg1MjU5ZjY3ZmFlMDlhMjY1MGQyYmM2MDA4OWUzMCIsIm5iZiI6MTc2NDQzNjEyNy4wNDEsInN1YiI6IjY5MmIyODlmMjM0YTBlNjM1NDZjZjY1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.in8rF-m91S0R0j8O9o19ulSsw29jn2gXjbusd1haEGs"]
}

    enum BaseUrl {
        case nowPlaying
        case popular
        case topRated
        case upcoming
        case personPopular

        var endpoint: String {
            switch self {
            case .nowPlaying:
                return "movie/now_playing"
            case .popular:
                return "movie/popular"
            case .topRated:
                return "movie/top_rated"
            case .upcoming:
                return "movie/upcoming"
            default:
                return "person/popular"
            }
        }

        var base: String {
                return "https://api.themoviedb.org/3/"
        }

        var fullUrl: String {
            return base + endpoint
        }
    }

