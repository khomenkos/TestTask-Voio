//
//  RegistrationViewController.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit
import ProgressHUD

class RegistrationViewController: UIViewController {
    
    // MARK: - Variables
    var activeTextField : UITextField? = nil
    
    // MARK: View
    private var views = RegistrationView()
    
    // MARK: Lifecycle
    override func loadView() {
        view = views
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupKeyboard()
        setupEventHandlers()
        setupDelegates()
    }
    
    // MARK: Actions
    private func setupEventHandlers() {
        views.registerButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        views.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private func setupDelegates() {
        views.nameTextField.delegate = self
        views.lastNameTextField.delegate = self
        views.emailTextField.delegate = self
        views.passwordTextField.delegate = self
        views.confirmPassTextField.delegate = self
    }
    
    @objc func loginButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func registrationButtonTapped() {
        guard let firstName = views.nameTextField.text, !firstName.isEmpty,
              let lastName = views.lastNameTextField.text, !lastName.isEmpty,
              let email = views.emailTextField.text, !email.isEmpty,
              let password = views.passwordTextField.text, !password.isEmpty, password.count >= 8,
              let confirmPass = views.confirmPassTextField.text, !confirmPass.isEmpty,
              password == confirmPass else {
            showAlert(withTitle: "Registration Error", message: "Check the data is correct and try again")
            return
        }
        ProgressHUD.show()
        AuthManager.shared.registerNewUser(firstName: firstName,
                                           lastName: lastName,
                                           email: email,
                                           password: password) { registered in
            DispatchQueue.main.async {
                if registered {
                    ProgressHUD.dismiss()
                    let vc = TabBarViewController()
                    vc.modalPresentationStyle = .overFullScreen
                    self.present(vc, animated: true)
                } else {
                    ProgressHUD.dismiss()
                    self.showAlert(withTitle: "Registration Error", message: "Check the data is correct and try again")
                }
            }
        }
    }
    
    // MARK: Setup Keyboard
    private func setupKeyboard() {
        hideKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        var shouldMoveViewUp = false
        
        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        
        if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
}
