//
//  HomeViewController.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Variables
    private var viewModel: SearchViewModel
    
    // MARK: View
    private var views = SearchView()
    
    // MARK: Initializers
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func loadView() {
        view = views
    }
    
    override func viewDidLoad() {
        title = "Search"
        view.backgroundColor = .systemBackground
        super.viewDidLoad()
        
        viewModel.delegate = self
        views.movieCollectionView.dataSource = self
        views.movieCollectionView.delegate = self
        views.searchBar.delegate = self
        
        hideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        views.movieCollectionView.reloadData()
    }
}

// MARK: - Collection View Delegate
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = viewModel.movies[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(movie: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        let detailVM = DetailViewModel(movie: movie)
        let detailVC = DetailViewController(viewModel: detailVM)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - Search Bar Delegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        if let text = searchBar.text {
            viewModel.fetchMovies(query: text)
            views.movieCollectionView.reloadData()
        }
    }
}

extension SearchViewController: SearchVMDelegate{
    func didUpdateMovies(_ movies: [Movie]) {
        self.views.movieCollectionView.reloadData()
    }
}

