//
//  HomeManager.swift
//  MovieApp
//
//  Created by Ferid on 07.12.25.
//

import Foundation

class HomeManager: HomeUseCase{ 

    let manager = NetworkingManager()

    func getHomeItems(
        title: String,
        endpoint: HomeEndpoint,
        completion: @escaping ((Movie?, String?) -> Void)
    ) {
        let url = NetworkingHelper.shared.configureHomeUrl(
            endpoint: endpoint.rawValue)
        manager
            .request(
                model: Movie.self,
                url: url,
                completion: completion
            )
    }
}
