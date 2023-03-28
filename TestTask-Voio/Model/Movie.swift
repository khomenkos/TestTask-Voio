//
//  Movie.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import Foundation

struct Movie: Decodable, Encodable {
    let trackId: Int
    let trackName: String?
    let artistName: String?
    let releaseDate: String?
    let shortDescription: String?
    let longDescription: String?
    let previewUrl: String?
    let artworkUrl100: String?
    let primaryGenreName: String?
    let trackPrice: Double?
    let currency: String?
    let trackViewUrl: String?
    let collectionViewUrl: String?
}

extension Movie {
    var storeURL: String {
        trackViewUrl ?? collectionViewUrl ?? ""
    }
    
    func formattedPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        guard let price = trackPrice else {
            return "More information"
        }
        return formatter.string(from: NSNumber(value: price)) ?? "More information"
    }
}
