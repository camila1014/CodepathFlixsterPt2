//
//  Posters.swift
//  Flixster
//
//  Created by Camila Aichele on 2/8/23.
//

import Foundation

struct PostersSearchResponse: Decodable {
    let results: [Posters]
}

struct Posters: Decodable {
    let artworkUrl100: URL
}
