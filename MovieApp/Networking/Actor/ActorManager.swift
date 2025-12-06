//
//  ActorManager.swift
//  MovieApp
//
//  Created by Ferid on 06.12.25.
//

import Foundation
import Alamofire

class ActorManager {

    let manager = NetworkingManager()

    func getActors(
        endpoint: BaseUrl,
        completion: @escaping ((Actors?, String?) -> Void)
    ) {
        manager
            .request(
                model: Actors.self,
                endpoint: endpoint,
                method: .get,
                completion: completion
            )
    }
}
