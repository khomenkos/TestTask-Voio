//
//  SearchCollectionViewCell.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit


class SearchCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    
    static let identifier = "SearchCollectionViewCell"
    
    private(set) var containerCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowRadius = 6.0
        view.layer.shadowOpacity = 0.7
        return view
    }()
    
    private(set) var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }()
    
    private(set) var movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 16.0)
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
        movieImageView.sd_setImage(with: movie.artworkUrl100.asUrl)
        movieTitleLabel.text = movie.trackName
        if let description = movie.shortDescription {
            movieDescriptionLabel.text = description
        } else {
            movieDescriptionLabel.text = movie.longDescription
        }
    }

    private func setupUI() {
        
        contentView.addSubview(containerCardView)
        containerCardView.addSubview(movieImageView)
        containerCardView.addSubview(movieTitleLabel)
        containerCardView.addSubview(movieDescriptionLabel)
        
        NSLayoutConstraint.activate([
            containerCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: containerCardView.topAnchor, constant: 10),
            movieImageView.leadingAnchor.constraint(equalTo: containerCardView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: containerCardView.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor),
            movieTitleLabel.leadingAnchor.constraint(equalTo: containerCardView.leadingAnchor),
            movieTitleLabel.trailingAnchor.constraint(equalTo: containerCardView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            movieDescriptionLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor),
            movieDescriptionLabel.leadingAnchor.constraint(equalTo: containerCardView.leadingAnchor, constant: 10),
            movieDescriptionLabel.trailingAnchor.constraint(equalTo: containerCardView.trailingAnchor, constant: -10),
            movieDescriptionLabel.bottomAnchor.constraint(equalTo: containerCardView.bottomAnchor, constant: -10)
        ])
    }
}


