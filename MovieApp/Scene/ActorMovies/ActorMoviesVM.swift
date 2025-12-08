//
//  ActorMoviesVM.swift
//  MovieApp
//
//  Created by Ferid on 07.12.25.
//

import Foundation


class ActorMoviesVM {

    let manager = ActorMoviesManager()
//        let manager = ActorMockManager()

    var items: [Cast] = []
    var id: Int

    init(id: Int) {
        self.id = id
    }

    var success: (() -> Void)?
    var error: ((String) -> Void)?

    func getActorMovies() {
        manager.getActorMovies(actorId: id) { actorM, error in
            if let error = error {
                self.error?(error)
            } else if let actorM = actorM {
                self.success?()
                self.items = actorM.crew ?? []
            }
        }
    }
}
