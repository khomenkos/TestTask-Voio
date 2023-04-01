//
//  Favorite.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 29.03.2023.
//

import Foundation

class FavoriteViewModel {
    
    weak var delegate: SearchVMDelegate?

    var favorites: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.didUpdateMovies(self.favorites)
            }
        }
    }
    
    func fetchMovies() {
        favorites = UserDefaultsManager.shared.fetchFavoriteMovies()
    }
}
