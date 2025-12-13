//
//  HomeVm.swift
//  MovieApp
//
//  Created by Ferid on 30.11.25.
//

import Foundation

final class HomeVM {

    let manager = HomeManager()

    var items: [HomeModel] = []

    var success: (() -> Void)?
    var error: ((String) -> Void)?


    func getMovies() {
        getCategory(endpoint: .popular, title: "Popular")
        getCategory(endpoint: .topRated, title: "Top rated")
        getCategory(endpoint: .nowPlaying, title: "Now playing")
        getCategory(endpoint: .upcoming, title: "Upcoming")
    }

    func getCategory(endpoint: HomeEndpoint, title: String) {
        manager
            .getHomeItems(
                title: title,
                endpoint: endpoint
            ) {
 movie,
 errorMessage in
                if let errorMessage = errorMessage {
                    self.error?(errorMessage)
                } else if let movie = movie {
                    self.success?()
                    self.items
                        .append(
                            .init(
                                title: title,
                                result: movie.results ?? [],
                                category: endpoint
                            )
                        )
                }
            }
    }
}

