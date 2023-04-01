//
//  DetailView.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 28.03.2023.
//

import UIKit

class DetailView: UIView {
    
    // MARK: Outlets
    private(set) var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.setDimensions(width: 155, height: 220)
        return imageView
    }()
    
    // Containers
    private(set) var movieInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private(set) var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private(set) var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private(set) var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textAlignment = .center
        return label
    }()
    
    private(set) var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private(set) var movieDirectorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private(set) var movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.lineBreakMode = .byWordWrapping
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .center
        return label
    }()
    
    //Buttons
    private(set) var favoritesButton: UIButton = {
        let button = Utilities().customButton()
        button.tintColor = UIColor(named: "customGray")
        return button
    }()
    
    private(set) var shareButton: UIButton = {
        let button = UIButton()
        button.sizeSymbol(name: "square.and.arrow.up", size: 20, weight: .light, scale: .medium)
        return button
    }()
    
    private(set) var movieTrailerButton: UIButton = {
        let button = Utilities().customButton()
        button.setTitle("Play Trailer", for: .normal)
        return button
    }()
    
    private(set) lazy var moviePriceButton: UIButton = {
        let button = Utilities().customButton()
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(movie: Movie) {
        let priceText = movie.formattedPrice()
        moviePriceButton.setTitle(priceText, for: .normal)
        
        movieImage.sd_setImage(with: movie.artworkUrl100?.asUrl)
        movieTitleLabel.text = movie.trackName
        movieReleaseDateLabel.text = movie.releaseDate?.yearMonthDayString()
        movieDirectorLabel.text = movie.artistName
        movieDescriptionLabel.text = movie.longDescription
    }
    
    // MARK: Setup UI
    private func setupUI() {        
        addSubview(movieImage)
        addSubview(movieInfoStackView)
        
        movieInfoStackView.addArrangedSubview(movieTitleLabel)
        movieInfoStackView.addArrangedSubview(movieReleaseDateLabel)
        movieInfoStackView.addArrangedSubview(movieDirectorLabel)
        movieInfoStackView.addArrangedSubview(movieDescriptionLabel)
        movieInfoStackView.addArrangedSubview(buttonsStackView)
        
        buttonsStackView.addArrangedSubview(moviePriceButton)
        buttonsStackView.addArrangedSubview(favoritesButton)
        buttonsStackView.addArrangedSubview(movieTrailerButton)
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            movieImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieInfoStackView.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 10),
            movieInfoStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            movieInfoStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
