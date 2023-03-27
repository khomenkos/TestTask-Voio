//
//  Route.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import Foundation

enum Route {
    static let baseUrl = "https://itunes.apple.com/search?term="
    case fetchMovie(String)
    
    var discription: String {
        switch self {
        case .fetchMovie(let query):
            return "\(query)&entity=movie"
        }
    }
}
