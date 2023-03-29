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
        case currentUserId
    }
    
    var currentUserId: String? {
        get {
            return defaults.string(forKey: DefaultKeys.currentUserId.rawValue)
        } set {
            defaults.set(newValue, forKey: DefaultKeys.currentUserId.rawValue)
        }
    }
    
    var favorites: [Movie]? {
        get {
            guard let userId = currentUserId,
                  let data = defaults.object(forKey: DefaultKeys.favorite.rawValue + userId) as? Data,
                  let movies = try? PropertyListDecoder().decode(Array<Movie>.self, from: data) else { return [] }
            return movies
        } set {
            guard let value = newValue, let userId = currentUserId else { return }
            defaults.set(try? PropertyListEncoder().encode(value), forKey: DefaultKeys.favorite.rawValue + userId)
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
        guard var favoriteArray = favorites else { return }
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
        guard let favorites = favorites else { return [] }
        return favorites
    }
    
    func updateCurrentUser(_ userId: String) {
        currentUserId = userId
    }
}

