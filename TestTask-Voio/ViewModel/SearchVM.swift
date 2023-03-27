//
//  HomeVM.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import Foundation
import ProgressHUD

protocol ViewModelDelegate: AnyObject {
    func didUpdateMovies(_ movies: [Movie])
}

class MovieListVM {
    var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.didUpdateMovies(self.movies)
            }
        }
    }
    weak var delegate: ViewModelDelegate?
    
    func fetchMovies(query: String) {
        ProgressHUD.show()
        APIService.shared.fetchMovie(query: query) { (result) in
            switch result {
            case .success(let movies):
                ProgressHUD.dismiss()
                self.movies = movies
            case .failure(_):
                ProgressHUD.showError()
            }
        }
    }
}
