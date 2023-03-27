//
//  Movie.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import Foundation

struct Movie: Decodable, Encodable {
    let trackId: Int
    let trackName: String
    let artistName: String
    let releaseDate: String
    let shortDescription: String?
    let longDescription: String
    let previewUrl: String
    let artworkUrl100: String
}
