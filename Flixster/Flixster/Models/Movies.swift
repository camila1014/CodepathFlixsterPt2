//
//  Movies.swift
//  Flixster
//
//  Created by Camila Aichele on 1/31/23.
//

import Foundation

// TODO: Pt 1 - Create a Track model struct
struct MoviesResponse: Decodable {
    let total_result: Int
    let results: [Movie]
}

struct Movie: Decodable {
    let originalTitle: String
    let overview: String
    
    let posterPath: String // when loading image with Nuke, make sure you convert to url by prepending base url
    static var posterBaseURLString: String = "https://image.tmdb.org/t/p/w185"
    static var backdropBaseURLString: String = "https://image.tmdb.org/t/p/w500"
    let backdropPath: String
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
}

extension Movie{
    
}

