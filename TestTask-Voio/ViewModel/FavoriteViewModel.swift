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
    
//    init(movieService: MovieServiceProtocol = MovieService()) {
//        self.movieService = movieService
//        fetchFavorites()
//    }
//
//    func fetchFavorites() {
//        let favorites = User
//
//        for favorite in favorites {
//            movieService.getFavorites(movieId: favorite) { [weak self] result in
//                switch result {
//                case .failure(let error):
//                    self?.error = error
//                case .success(let movies):
//                    self?.favorites.append(contentsOf: movies)
//                }
//            }
//        }
//    }
}
