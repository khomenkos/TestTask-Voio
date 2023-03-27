//
//  ProfileView.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 28.03.2023.
//


import UIKit

class ProfileView: UIView {
    
    // MARK: Outlets

    // Labels
    private(set) var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Galvji Bold", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private(set) var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Galvji Bold", size: 15)
        label.textAlignment = .right
        label.textColor = .gray
        return label
    }()
    
    // MARK: Containers
    
    //Info Stack
    private lazy var emailContainer: UIStackView = {
        let stack = Utilities().containerView(withlabel: "Email", view: emailLabel)
        stack.axis = .horizontal
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 15
        return stack
    }()
    
    private let infoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    // Buttons
    private(set) var logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.backgroundColor = UIColor(named: "darkBlue")
        button.titleLabel?.font = UIFont(name: "Gill Sans SemiBold", size: 17)
        button.layer.cornerRadius = 15
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
    private func setupUI(){
        let stackMain = UIStackView(arrangedSubviews: [fullNameLabel, infoStack])
        stackMain.translatesAutoresizingMaskIntoConstraints = false
        stackMain.axis = .vertical
        stackMain.spacing = 30
        
        addSubview(stackMain)
        infoStack.addArrangedSubview(emailContainer)
        addSubview(logOutButton)
        
        NSLayoutConstraint.activate([
            stackMain.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
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
