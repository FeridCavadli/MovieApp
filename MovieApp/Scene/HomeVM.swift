//
//  HomeVm.swift
//  MovieApp
//
//  Created by Ferid on 30.11.25.
//

import Foundation

final class HomeVM {
    let manager = NetworkingManager()

    var items: [HomeModel] = []

    var success: (() -> Void)?
    var error: ((String) -> Void)?


    func getMovies() {
        getPlayingMovies()
        getPopularMovies()
        getUpcomingMovies()
        getTopRatedMovies()
    }

    func getPopularMovies() {
        manager
            .request(
                model: Movie.self,
                endpoint: .popular,
                method: .get
            ) { data, errorMessage in
            if let errorMessage = errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.success?()
                self.items.append(.init(title: "Popular", result: data.results ?? []))
            }
        }
    }

    func getPlayingMovies() {
        manager
            .request(
                model: Movie.self,
                endpoint: .topRated,
                method: .get
            ) { data, errorMessage in
            if let errorMessage = errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.success?()
                self.items.append(.init(title: "Top rated", result: data.results ?? []))
            }
        }
    }


    func getTopRatedMovies() {
        manager
            .request(
                model: Movie.self,
                endpoint: .nowPlaying,
                method: .get
            ) { data, errorMessage in
            if let errorMessage = errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.success?()
                self.items.append(.init(title: "Now playing", result: data.results ?? []))
            }
        }
    }
    func getUpcomingMovies() {
        manager
            .request(
                model: Movie.self,
                endpoint: .upcoming,
                method: .get
            ) { data, errorMessage in
            if let errorMessage = errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.success?()
                self.items.append(.init(title: "Upcoming", result: data.results ?? []))
            }
        }
    }
}
