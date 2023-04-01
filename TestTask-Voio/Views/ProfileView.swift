//
//  ProfileView.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 28.03.2023.
//


import UIKit

class ProfileView: UIView {
    
    // MARK: Outlets
    
    //User Image
    private(set) var image: UIImageView = {
        let imageView = UIImageView()
        imageView.setDimensions(width: 120, height: 120)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 4
        imageView.layer.cornerRadius = 120 / 2
        return imageView
    }()
    
    // Labels
    private(set) var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private(set) var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    // MARK: Containers
    
    //Info Stack
    private lazy var emailContainer: UIStackView = {
        let stack = Utilities().containerView(withlabel: "Email", view: emailLabel)
        stack.axis = .horizontal
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = UIColor(named: "customGray")
        stack.layer.cornerRadius = 15
        return stack
    }()
    
    // Buttons
    private(set) var logOutButton: UIButton = {
        let button = Utilities().customButton()
        button.setTitle("Log Out", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
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
    
    // MARK: Setup UI
    private func setupUI() {
        let stackMain = UIStackView(arrangedSubviews: [fullNameLabel, emailContainer])
        stackMain.translatesAutoresizingMaskIntoConstraints = false
        stackMain.axis = .vertical
        stackMain.spacing = 30
        
        addSubview(image)
        addSubview(stackMain)
        addSubview(logOutButton)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackMain.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            stackMain.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackMain.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            logOutButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logOutButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logOutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            fullNameLabel.heightAnchor.constraint(equalToConstant: 30),
            emailLabel.heightAnchor.constraint(equalToConstant: 50),
            logOutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
