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
        //view.backgroundColor = UIColor(named: "customGray")
        view.layer.cornerRadius = 15.0
        view.layer.borderColor = UIColor(named: "customGray")?.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    private let infoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(named: "customGray")
        stackView.layer.cornerRadius = 10
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private(set) var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10.0
        imageView.setDimensions(width: 80, height: 125)
        return imageView
    }()
    
    private(set) var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = .white
        return label
    }()
    
    private(set) var movieYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .lightGray
        return label
    }()
    
    private(set) var movieGenreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .lightGray
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
        //containerCardView.addSubview(movieTitleLabel)
        containerCardView.addSubview(infoStack)
        infoStack.addArrangedSubview(movieTitleLabel)
        infoStack.addArrangedSubview(movieYearLabel)
        infoStack.addArrangedSubview(movieGenreLabel)
        
        NSLayoutConstraint.activate([
            containerCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            containerCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            containerCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: containerCardView.topAnchor),
            movieImageView.centerXAnchor.constraint(equalTo: containerCardView.centerXAnchor),
            //movieImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
//        NSLayoutConstraint.activate([
//            movieTitleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor),
//            movieTitleLabel.leadingAnchor.constraint(equalTo: containerCardView.leadingAnchor, constant: 5),
//            movieTitleLabel.trailingAnchor.constraint(equalTo: containerCardView.trailingAnchor, constant: -5)
//        ])
        
        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: movieImageView.bottomAnchor),
            infoStack.leadingAnchor.constraint(equalTo: containerCardView.leadingAnchor),
            infoStack.trailingAnchor.constraint(equalTo: containerCardView.trailingAnchor),
            infoStack.bottomAnchor.constraint(equalTo: containerCardView.bottomAnchor)
        ])
    }
}
