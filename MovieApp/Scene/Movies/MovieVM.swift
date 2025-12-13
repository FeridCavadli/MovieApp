//
//  MovieVM.swift
//  MovieApp
//
//  Created by Ferid on 12.12.25.
//

import Foundation

class MovieVM {

    let manager = HomeManager()
    var items: [MovieResult] = []

    var category: HomeEndpoint

    init(category: HomeEndpoint) {
        self.category = category
    }

    var success: (() -> Void)?
    var error: ((String) -> Void)?

    func getMovies() {
        manager.getHomeItems(title: category.rawValue, endpoint: category) {
            movie,
            error in
            if let error = error {
                self.error?(error)
            } else if let movie = movie {
                self.items = movie.results ?? []
                self.success?()
            }
        }
    }
}
