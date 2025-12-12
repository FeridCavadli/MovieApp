//
//  MovieDetailsEndpoint.swift
//  MovieApp
//
//  Created by Ferid on 11.12.25.
//

import Foundation

enum MovieDetailsEndpoint {
    case movie(id: Int)

    var path: String {
        switch self {
        case .movie(let id):
            return "movie/\(id)"
        }
    }
}
