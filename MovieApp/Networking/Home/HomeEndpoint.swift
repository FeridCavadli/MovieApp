//
//  HomeEndpoint.swift
//  MovieApp
//
//  Created by Ferid on 07.12.25.
//

import Foundation

enum HomeEndpoint: String {
    case nowPlaying = "movie/now_playing"
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"


//    var path: String {
//        return NetworkingHelper.shared.configureHomeUrl(endpoint: self.rawValue)
//    }
}
