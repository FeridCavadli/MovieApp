//
//  ActorVM.swift
//  MovieApp
//
//  Created by Ferid on 06.12.25.
//

import Foundation

class ActorVM {

    let manager = ActorManager()
//    let manager = ActorMockManager()

    var items: [ActorResult] = []

    var success: (() -> Void)?
    var error: ((String) -> Void)?

    func getActors() {
        manager.getActors { actor, error in
            if let error = error {
                self.error?(error)
            } else if let actor = actor {
                self.success?()
                self.items = actor.results ?? []
                print(actor.results ?? "")
            }
        }
    }
}
