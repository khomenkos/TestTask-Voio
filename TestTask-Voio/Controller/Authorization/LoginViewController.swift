//
//  LoginViewController.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit
import ProgressHUD

class LoginViewController: UIViewController {
    
    // MARK: View
    private var views = LoginView()
    
    // MARK: Lifecycle
    override func loadView() {
        view = views
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        hideKeyboard()
        setupEventHandlers()
    }
    
    private func setupEventHandlers() {
        views.loginButton.addTarget(self, action: #selector(self.loginButtonTapped), for: .touchUpInside)
        views.registrationButton.addTarget(self, action: #selector(self.registrationButtonTapped), for: .touchUpInside)
    }
    
    // MARK: Actions
    @objc func registrationButtonTapped() {
        let signUpVC = RegistrationViewController()
        signUpVC.modalPresentationStyle = .overFullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc func loginButtonTapped() {
        guard let email = views.emailTextField.text,
              !email.isEmpty,
              let password = views.passwordTextField.text,
              !password.isEmpty,
              password.count >= 8 else {
            self.showAlert(withTitle: "Login Error", message: "Check the data is correct and try again.")
            return
        }
        ProgressHUD.show()
        
        AuthManager.shared.loginUser(email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    ProgressHUD.dismiss()
                    let vc = TabBarViewController()
                    vc.modalPresentationStyle = .overFullScreen
                    self.present(vc, animated: true)
                } else {
                    ProgressHUD.dismiss()
                    self.showAlert(withTitle: "Login Error", message: "Check the data is correct and try again.")
                }
            }
        }
    }
}
