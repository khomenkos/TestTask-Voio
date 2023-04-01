//
//  LoginView.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit

class LoginView: UIView {
    
    // MARK: Outlets
    // Labels
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back!"
        label.font = UIFont.systemFont(ofSize: 33, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let adviceLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter your email address and enter password"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    // Buttons
    private(set) var loginButton: UIButton = {
        let button = Utilities().customButton()
        button.setTitle("Log In", for: .normal)
        return button
    }()
    
    private(set) var registrationButton: UIButton = {
        let button = Utilities().attributedButton("Don't have an account?", " Sign Up")
        return button
    }()
    
    // Containers
    private lazy var emailContainer: UIStackView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor(named: "customYellow")
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "mail")
        imageView.setDimensions(width: 25, height: 40)
        let stack = Utilities().imageContainerView(withImage: imageView, textField: emailTextField)
        return stack
    }()
    
    private lazy var passwordContainer: UIStackView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor(named: "customYellow")
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "lock.fill")
        imageView.setDimensions(width: 25, height: 40)
        let stack = Utilities().imageContainerView(withImage: imageView, textField: passwordTextField)
        return stack
    }()
    
    // Text Field
    private(set) var emailTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Email")
        textField.autocapitalizationType = .none
        textField.returnKeyType = .continue
        return textField
    }()
    
    private(set) var passwordTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Password")
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.returnKeyType = .done
        return textField
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraints
    private func setupUI(){
        let stackMain = UIStackView(arrangedSubviews: [welcomeLabel, adviceLabel, emailContainer, passwordContainer, loginButton,  registrationButton])
        stackMain.translatesAutoresizingMaskIntoConstraints = false
        stackMain.axis = .vertical
        stackMain.spacing = 15
        
        addSubview(stackMain)
        NSLayoutConstraint.activate([
            stackMain.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackMain.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackMain.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
