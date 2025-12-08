//
//  ActorMoviesUseCase.swift
//  MovieApp
//
//  Created by Ferid on 07.12.25.
//

import Foundation

protocol ActorMoviesUseCase {
    func getActorMovies(
        actorId: Int,
        completion: @escaping (
            (MovieCredit?, String?) -> Void
        )
    )
}
