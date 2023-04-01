//
//  RegistrationView.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit

class RegistrationView: UIView {
    
    // MARK: Outlets
    
    //ScrollView
    private let scrollView = UIScrollView()
    
    //Image
    private(set) var imagePicker = UIImagePickerController()
    var profileImage: UIImage?
    
    //Labels
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "SignUp"
        label.font = UIFont.systemFont(ofSize: 33, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let adviceLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter your email address and enter password"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Containers
    private lazy var firstNameContainer: UIStackView = {
        let stack = Utilities().containerView(withlabel: "First Name", view: nameTextField)
        return stack
    }()
    
    private lazy var lastNameContainer: UIStackView = {
        let stack = Utilities().containerView(withlabel: "Last Name", view: lastNameTextField)
        return stack
    }()
    
    private lazy var emailContainer: UIStackView = {
        let stack = Utilities().containerView(withlabel: "Email", view: emailTextField)
        return stack
    }()
    
    private lazy var passwordContainer: UIStackView = {
        let stack = Utilities().containerView(withlabel: "Password", view: passwordTextField)
        return stack
    }()
    
    private lazy var confirmPassContainer: UIStackView = {
        let stack = Utilities().containerView(withlabel: "Confirm Password", view: confirmPassTextField)
        return stack
    }()
    
    // Text Fields
    private(set) var nameTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "First Name")
        textField.returnKeyType = .continue
        return textField
    }()
    
    private(set) var lastNameTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Last Name")
        textField.returnKeyType = .continue
        return textField
    }()
    
    private(set) var emailTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Email")
        textField.returnKeyType = .continue
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private(set) var passwordTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Password (min 8 symbols)")
        textField.returnKeyType = .continue
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private(set) var confirmPassTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Confirm Password")
        textField.returnKeyType = .done
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    // Buttons
    private(set) var registerButton: UIButton = {
        let button = Utilities().customButton()
        button.setTitle("Register", for: .normal)
        return button
    }()
    
    private(set) var loginButton: UIButton = {
        let button = Utilities().attributedButton("Already have an account?", " Log In")
        return button
    }()
    
    private(set) var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.setDimensions(width: 128, height: 128)
        button.layer.cornerRadius = 128 / 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 3
        
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
        let stackMain = UIStackView(arrangedSubviews: [firstNameContainer, lastNameContainer, emailContainer, passwordContainer, confirmPassContainer, registerButton, loginButton])
        stackMain.translatesAutoresizingMaskIntoConstraints = false
        stackMain.axis = .vertical
        stackMain.spacing = 20
        
        scrollView.keyboardDismissMode = .onDrag
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(scrollView)
        scrollView.addSubview(signUpLabel)
        scrollView.addSubview(adviceLabel)
        scrollView.addSubview(plusPhotoButton)
        scrollView.addSubview(stackMain)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            signUpLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            adviceLabel.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 10),
            adviceLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            plusPhotoButton.topAnchor.constraint(equalTo: adviceLabel.bottomAnchor, constant: 10),
            plusPhotoButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackMain.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackMain.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackMain.topAnchor.constraint(equalTo: plusPhotoButton.bottomAnchor, constant: 16),
            stackMain.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            confirmPassTextField.heightAnchor.constraint(equalToConstant: 50),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
