//
//  DetailVM.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 28.03.2023.
//

import Foundation

class DetailViewModel {
    var movie: Movie
    var isFavorite = true

    init(movie: Movie) {
        self.movie = movie
        isFavorite = UserDefaultsManager.shared.isFavoriteMovie(movie)
    }
}
