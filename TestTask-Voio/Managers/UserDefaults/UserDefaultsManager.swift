//
//  UserDefaultsManager.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    let defaults = UserDefaults.standard
    
    private enum DefaultKeys: String {
        case favorite
    }
    
    var favorites: [Movie]?{
        get {
            if let data = defaults.object(forKey: DefaultKeys.favorite.rawValue) as? Data,
               let movies = try? PropertyListDecoder().decode(Array<Movie>.self, from: data) {
                return movies
            }
            return []
        } set {
            guard let value = newValue else {return}
            defaults.set(try? PropertyListEncoder().encode(value), forKey: DefaultKeys.favorite.rawValue)
        }
    }
    
    func addMovieToFavorites(movie: Movie) {
        guard var array = favorites else {return}
        array.append(movie)
        favorites = array
    }    
    
    func isFavoriteMovie(_ movie: Movie) -> Bool {
        guard let favoritesArray = favorites else { return false }
        for favorite in favoritesArray {
            if favorite.trackId == movie.trackId {
                return true
            }
        }
        return false
    }
    
    func removeMovieFromFavorites(_ movie: Movie) {
        guard var favoriteArray = favorites else {return}
        var index = Int()
        for (i,favorite) in favoriteArray.enumerated() {
            if favorite.trackId == movie.trackId {
                index = i
            }
        }
        favoriteArray.remove(at: index)
        favorites = favoriteArray
    }
    
    func fetchFavoriteMovies() -> [Movie] {
        guard let favorites = favorites else {return []}
        return favorites
    }
}

