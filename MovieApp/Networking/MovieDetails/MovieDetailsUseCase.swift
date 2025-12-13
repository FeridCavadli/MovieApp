//
//  MovieDetailsUseCase.swift
//  MovieApp
//
//  Created by Ferid on 11.12.25.
//

import Foundation

protocol MovieDetailsUseCase {
    func getMovieDetails(movieId: Int, completion: @escaping ((MovieDetails?, String?) -> Void) ) 

}
