//
//  Actor.swift
//  MovieApp
//
//  Created by Ferid on 06.12.25.
//

import Foundation

// MARK: - Actor
struct Actors: Codable {
    let page: Int?
    let results: [ActorResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ActorResult: Codable, LabelImageProtocol {
    var titleText: String {
        name ?? ""
    }

    var imageURL: String {
        profilePath ?? ""
    }
    
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: String?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let knownFor: [KnownFor]?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

// MARK: - KnownFor
struct KnownFor: Codable {
    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let name, originalName, overview, posterPath: String?
    let mediaType: String?
    let originalLanguage: String?
    let genreIDS: [Int]?
    let popularity: Double?
    let firstAirDate: String?
    let voteAverage: Double?
    let voteCount: Int?
    let originCountry: [String]?
    let title, originalTitle, releaseDate: String?
    let video: Bool?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, name
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
        case title
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case video
    }
}

//enum MediaType: String, Codable {
//    case movie
//    case tv
//}

//enum OriginCountry: String, Codable {
//    case cn = "CN"
//    case no = "NO"
//    case us = "US"
//}
//
//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case es = "es"
//    case no = "no"
//    case zh = "zh"
//}

//enum KnownForDepartment: String, Codable {
//    case acting = "Acting"
//    case directing = "Directing"
//}



