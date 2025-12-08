//
//  ActorManager.swift
//  MovieApp
//
//  Created by Ferid on 06.12.25.
//

import Foundation


class ActorManager: ActorUseCase {

    let manager = NetworkingManager()

    func getActors(
        completion: @escaping ((Actors?, String?) -> Void)
    ) {
        let url = NetworkingHelper.shared.configureActorUrl(
            endpoint: ActorEnpoint.popularActors.rawValue
        )
        manager
            .request(
                model: Actors.self,
                url: url,
                completion: completion
            )
    }
}
