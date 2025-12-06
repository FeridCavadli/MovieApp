//
//  ActorVM.swift
//  MovieApp
//
//  Created by Ferid on 06.12.25.
//

import Foundation

class ActorVM {

//    let manager = NetworkingManager()
    let manager = ActorManager()
    var items: [ActorResult] = []

    var success: (() -> Void)?
    var error: ((String) -> Void)?

    func getActors() {
        manager.getActors(endpoint: .personPopular) { actor, error in
            if let error = error {
                self.error?(error)
            } else if let actor = actor {
                self.success?()
                self.items = actor.results ?? []
            }
        }
    }
}
