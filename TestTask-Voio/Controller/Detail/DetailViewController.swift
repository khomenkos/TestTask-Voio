//
//  DetailViewController.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit
import AVKit
import AVFoundation

class DetailViewController: UIViewController {
    
    // MARK: - Variables
    private var viewModel: DetailViewModel
    
    private var moviePlayerController = AVPlayerViewController()
    private var playerView = AVPlayer()
    
    // MARK: View
    private var views = DetailView()
    
    // MARK: Initializers
    init(viewModel: DetailViewModel) {
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
        view.backgroundColor = UIColor(named: "customDark")
        setupUI()
        setupEventHandlers()
        setupNavBar()
    }
    
    // MARK: Helpers
    private func setupUI() {
        views.configure(movie: viewModel.movie)
        updateStarButton()
    }
    
    private func playVideo() {
        guard let url = viewModel.movie.previewUrl?.asUrl else {
            showAlert(withTitle: "Trailer is not available!", message: "Try again")
            return
        }
        playerView = AVPlayer(url: url)
        moviePlayerController.player = playerView
        self.present(moviePlayerController, animated: true) {
            self.moviePlayerController.player?.play()
        }
    }
    
    // MARK: Actions
    private func setupEventHandlers() {
        views.moviePriceButton.addTarget(self, action: #selector(self.priceButtonPressed), for: .touchUpInside)
        views.movieTrailerButton.addTarget(self, action: #selector(self.playButtonPressed), for: .touchUpInside)
        views.favoritesButton.addTarget(self, action: #selector(self.favoriteButtonPressed), for: .touchUpInside)
        views.shareButton.addTarget(self, action: #selector(self.shareButtonPressed), for: .touchUpInside)
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: views.shareButton)
    }
    
    @objc func priceButtonPressed() {
        guard let url = viewModel.movie.storeURL.asUrl else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func shareButtonPressed() {
        guard let url = viewModel.movie.trackViewUrl?.asUrl else { return }
        DispatchQueue.global().async {
            let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            DispatchQueue.main.async {
                self.present(activityViewController, animated: true, completion: nil)
            }
        }
    }
    
    @objc func favoriteButtonPressed() {
        viewModel.isFavorite.toggle()
        updateStarButton()
        if viewModel.isFavorite {
            UserDefaultsManager.shared.addMovieToFavorites(movie: viewModel.movie)
        } else {
            UserDefaultsManager.shared.removeMovieFromFavorites(viewModel.movie)
        }
    }
    
    @objc func playButtonPressed() {
        playVideo()
    }
    
    private func updateStarButton() {
        let image = viewModel.isFavorite ? "star.fill" : "star"
        views.favoritesButton.sizeSymbol(name: image, size: 30, weight: .light, scale: .medium)
    }
}
