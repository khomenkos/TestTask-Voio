//
//  TabBarViewController.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
        
    private func setUpTabs() {
        let homeVC = SearchViewController(viewModel: MovieListVM())
        let favoriteVC = FavoriteViewController()
        let profileVC = ProfileViewController()

        homeVC.navigationItem.largeTitleDisplayMode = .automatic
        favoriteVC.navigationItem.largeTitleDisplayMode = .automatic
        profileVC.navigationItem.largeTitleDisplayMode = .never

        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: favoriteVC)
        let nav3 = UINavigationController(rootViewController: profileVC)

        nav1.tabBarItem = UITabBarItem(title: "Search",
                                       image: UIImage(systemName: "magnifyingglass"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Favorite",
                                       image: UIImage(systemName: "star"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Profile",
                                       image: UIImage(systemName: "person.circle"),
                                       tag: 3)

        for nav in [nav1, nav2, nav3] {
            nav.navigationBar.prefersLargeTitles = true
        }

        setViewControllers(
            [nav1, nav2, nav3],
            animated: true
        )
    }
}
