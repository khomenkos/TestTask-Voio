//
//  FavoriteView.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 28.03.2023.
//

import UIKit

class FavoriteView: UIView {
    
    // MARK: - Outlets
    private(set) var movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 120)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: FavoriteCollectionViewCell.identifier)
        return collectionView
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
    private func setupUI() {
        backgroundColor = .white
        addSubview(movieCollectionView)
        
        NSLayoutConstraint.activate([
            movieCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            movieCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            movieCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            movieCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
