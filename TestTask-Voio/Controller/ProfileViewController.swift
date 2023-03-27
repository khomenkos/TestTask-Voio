//
//  ProfileViewController.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit
import FirebaseAuth
import ProgressHUD

class ProfileViewController: UIViewController {
    
    private var user: User? {
        didSet {
            ProgressHUD.dismiss()
            configure()
        }
    }
    // MARK: View
    private var views = ProfileView()
    
    // MARK: Lifecycle
    override func loadView() {
        view = views
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = UIColor(named: "lightGray")
        loadData()
        setupEventHandlers()
    }
    
    // MARK: Actions
    private func setupEventHandlers() {
        views.logOutButton.addTarget(self, action: #selector(logOutBtn), for: .touchUpInside)
    }
    
    @objc private func logOutBtn() {
        showConfirmationAlert(withTitle: "Log Out", message: "Are you sure you want to log out?", confirmationHandler: {
            AuthManager.shared.logOut(completion: { success in
                DispatchQueue.main.async {
                    if success {
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    } else {
                        ProgressHUD.showError("Could not log out user")
                    }
                }
            })
        })
    }
    
    // MARK: Helpers
    private func configure() {
        guard let user = user else { return }
        views.fullNameLabel.text = user.fullName
        views.emailLabel.text = user.email
    }
    
    func loadData() {
        guard let uid = Auth.auth().currentUser?.uid else {
            ProgressHUD.showError("User not logged in")
            return
        }
        ProgressHUD.show()
        DatabaseManager.shared.fetchUser(uid: uid) { user in
            self.user = user
        }
    }
}
