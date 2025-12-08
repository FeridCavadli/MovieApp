//
//  ActorMockManager.swift
//  MovieApp
//
//  Created by Ferid on 07.12.25.
//

import Foundation


class ActorMockManager: ActorUseCase {

    
    func getActors(completion: @escaping ((Actors?, String?) -> Void)) {

        guard let url = Bundle.main.url(forResource: "ActorMockData", withExtension: "json") else {return }
        do {
            let data = try Data(contentsOf: url)
            let actors = try JSONDecoder().decode(Actors.self, from: data)
            completion(actors, nil)
        }
        catch {
            print(error.localizedDescription)
            completion(nil, error.localizedDescription)
        }
    }
}
