//
//  HomeUseCase.swift
//  MovieApp
//
//  Created by Ferid on 07.12.25.
//

import Foundation

protocol HomeUseCase {
    func getHomeItems(
        title: String,
        endpoint: HomeEndpoint,
        completion: @escaping ((Movie?, String?) -> Void)
    ) 
}
