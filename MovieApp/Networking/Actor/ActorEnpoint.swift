//
//  ActorEnpoint.swift
//  MovieApp
//
//  Created by Ferid on 07.12.25.
//

import Foundation

enum ActorEnpoint {
    case popularActors(page: Int)

    var path: String {
        switch self {
        case .popularActors(let page):
            return "person/popular?page=\(page)"
        }
    }
}
