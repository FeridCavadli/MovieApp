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
        getPlayingMovies()
        getPopularMovies()
        getTopRatedMovies()
        getUpcomingMovies()
    }

    func getPopularMovies() {
        manager
            .getHomeItems(
                endpoint: HomeEndpoint.popular
            ) { movie, errorMessage in
                if let errorMessage = errorMessage {
                    self.error?(errorMessage)
                } else if let movie = movie {
                    self.success?()
                    self.items.append(.init(title: "Popular", result: movie.results ?? []))
                }
            }
    }
    func getPlayingMovies() {
        manager
            .getHomeItems(
                endpoint: HomeEndpoint.topRated
            ) { movie, errorMessage in
                if let errorMessage = errorMessage {
                    self.error?(errorMessage)
                } else if let movie = movie {
                    self.success?()
                    self.items.append(.init(title: "Top rated", result: movie.results ?? []))
            }
        }
    }

    func getTopRatedMovies() {
        manager
            .getHomeItems(
                endpoint: HomeEndpoint.nowPlaying
            ) { movie, errorMessage in
                if let errorMessage = errorMessage {
                    self.error?(errorMessage)
                } else if let movie = movie {
                    self.success?()
                    self.items.append(.init(title: "Now playing", result: movie.results ?? []))
            }
        }
    }

    func getUpcomingMovies() {
        manager
            .getHomeItems(
                endpoint: HomeEndpoint.upcoming
            ) { movie, errorMessage in
                if let errorMessage = errorMessage {
                    self.error?(errorMessage)
                } else if let movie = movie {
                    self.success?()
                    self.items.append(.init(title: "Upcoming", result: movie.results ?? []))
            }
        }
    }
}

