//
//  ActorMovies.swift
//  MovieApp
//
//  Created by Ferid on 07.12.25.
//

import Foundation


class ActorMoviesManager: ActorMoviesUseCase {
    let manager = NetworkingManager()

    func getActorMovies(
        actorId: Int,
        completion: @escaping ((MovieCredit?, String?) -> Void)
    ) {
        let url = NetworkingHelper.shared.configureActorMoviesUrl(
            endpoint: ActorMoviesEndpoint.actorMovies(actorId: actorId).path
        )
        manager
            .request(model: MovieCredit.self, url: url, completion: completion)
    }
}
