//
//  Movie.swift
//  modul_19.7
//
//  Created by Admin on 27/05/24.
//

import Foundation

struct PopularMoviesResponse: Decodable {
    let films: [Movie]
}

struct Movie: Decodable {
    let filmId: Int
    let nameRu: String
    let posterUrl: String
//    let title: String
//    let posterUrl: String
//    let description: String
}
