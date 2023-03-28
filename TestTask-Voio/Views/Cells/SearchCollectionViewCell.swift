//
//  SearchCollectionViewCell.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit
import SDWebImage

class SearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchCollectionViewCell"
    
    // MARK: - Outlets
    private(set) var containerCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10.0
        view.setupShadow(radius: 6, shadowOpacity: 0.7)
        return view
    }()
    
    private let infoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(named: "lightGray")
        stackView.layer.cornerRadius = 10
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.layoutMargins = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private(set) var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10.0
        return imageView
    }()
    
    private(set) var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) var movieYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) var movieGenreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup UI
    func configure(movie: Movie) {
        movieImageView.sd_setImage(with: movie.artworkUrl100?.asUrl)
        movieTitleLabel.text = movie.trackName
        guard let dateRelease = movie.releaseDate?.yearMonthDayString() else { return }
        movieYearLabel.text = dateRelease
        movieGenreLabel.text = movie.primaryGenreName
    }
    
    private func setupUI() {
        contentView.addSubview(containerCardView)
        containerCardView.addSubview(movieImageView)
        containerCardView.addSubview(movieTitleLabel)
        containerCardView.addSubview(infoStack)
        infoStack.addArrangedSubview(movieYearLabel)
        infoStack.addArrangedSubview(movieGenreLabel)
        
        NSLayoutConstraint.activate([
            containerCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: containerCardView.topAnchor, constant: 10),
            movieImageView.centerXAnchor.constraint(equalTo: containerCardView.centerXAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor),
            movieTitleLabel.leadingAnchor.constraint(equalTo: containerCardView.leadingAnchor, constant: 5),
            movieTitleLabel.trailingAnchor.constraint(equalTo: containerCardView.trailingAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 5),
            infoStack.leadingAnchor.constraint(equalTo: containerCardView.leadingAnchor, constant: 5),
            infoStack.trailingAnchor.constraint(equalTo: containerCardView.trailingAnchor, constant: -5),
            infoStack.bottomAnchor.constraint(equalTo: containerCardView.bottomAnchor, constant: -10)
        ])
    }
}
