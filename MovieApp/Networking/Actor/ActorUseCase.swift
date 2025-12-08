//
//  ActorUseCase.swift
//  MovieApp
//
//  Created by Ferid on 07.12.25.
//

import Foundation

protocol ActorUseCase {
    func getActors(
        completion: @escaping ((Actors?, String?) -> Void)
    )
}
