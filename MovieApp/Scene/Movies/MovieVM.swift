//
//  MovieVM.swift
//  MovieApp
//
//  Created by Ferid on 12.12.25.
//

import Foundation

class MovieVM {

    let manager = HomeManager()
    var items: HomeModel

    init(items: HomeModel) {
        self.items = items
    }

    var success: (() -> Void)?
    var error: ((String) -> Void)?

    func getMovies(endpoint: HomeEndpoint) {
        manager.getHomeItems(title: String, endpoint: endpoint) { movie, error in
            if let error = error {
                self.error?(error)
            } else if let movie = movie {
                self.items = .init(title: title, result: movie.results)
                self.success?()
            }
        }
    }
}
