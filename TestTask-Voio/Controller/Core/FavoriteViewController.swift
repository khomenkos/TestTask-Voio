//
//  FavoriteViewController.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    // MARK: - Variables
    private var viewModel: FavoriteViewModel
    
    // MARK: View
    private var views = FavoriteView()
    
    // MARK: Initializers
    init(viewModel: FavoriteViewModel) {
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
        super.viewDidLoad()
        viewModel.delegate = self
        setupCollectionView()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchMovies()
    }
    
    // MARK: Methods
    private func setupCollectionView() {
        views.movieCollectionView.dataSource = self
        views.movieCollectionView.delegate = self
    }
    
    private func setupUI() {
        title = "Favorite"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        view.backgroundColor = UIColor(named: "customDark")
    }
    
    private func showNoResult() {
        views.noResult.isHidden = UserDefaultsManager.shared.favorites?.count ?? 0 > 0
    }
}

// MARK: - Collection View Delegate

extension FavoriteViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = viewModel.favorites[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCollectionViewCell.identifier, for: indexPath) as? FavoriteCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(movie: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.favorites[indexPath.row]
        let detailVM = DetailViewModel(movie: movie)
        let detailVC = DetailViewController(viewModel: detailVM)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension FavoriteViewController: SearchVMDelegate {
    func didUpdateMovies(_ movies: [Movie]) {
        showNoResult()
        self.views.movieCollectionView.reloadData()
    }
}
