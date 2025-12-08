//
//  ActorMoviesEndpoint.swift
//  MovieApp
//
//  Created by Ferid on 07.12.25.
//

import Foundation

enum ActorMoviesEndpoint {
    case actorMovies(actorId: Int)

    var path: String {
        switch self {
        case .actorMovies(let actorId):
            return "person/\(actorId)/movie_credits"
        }
    }
}
