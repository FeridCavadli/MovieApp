//
//  MovieDetailsVM.swift
//  MovieApp
//
//  Created by Ferid on 11.12.25.
//

import Foundation

class MovieDetailsVM {


    let manager = MovieDetailsManager()


    var items: MovieDetails?

    var error: ((String) -> Void)?
    var success: (() -> Void)?
    var id: Int

    init(id: Int) {
        self.id = id
    }

    func getMovieDetails() {
        manager.getMovieDetails(movieId: id) { movieDetails, errorumuz in
            if let error = errorumuz {
                self.error?(error)
            } else if let movieDetails = movieDetails {
                self.items = movieDetails
                self.success?()
            }
        }
    }
}
