//
//  MovieDetailsManager.swift
//  MovieApp
//
//  Created by Ferid on 11.12.25.
//

import Foundation

class MovieDetailsManager: MovieDetailsUseCase {

    let manager = NetworkingManager()

    func getMovieDetails(movieId: Int, completion: @escaping (
        (MovieDetails?, String?) -> Void)) {
        let url = NetworkingHelper.shared.configureMovieDetails(
            endpoint: MovieDetailsEndpoint.movie(id: movieId).path
        )
            manager
                .request(
                    model: MovieDetails.self,
                    url: url,
                    completion: completion
                )
    }
}
