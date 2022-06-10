//
//  TabBarViewController.swift
//  GBShop
//
//  Created by Сергей Черных on 06.06.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        setupViewControllers()
    }
    
    private func configureViews() {
        view.backgroundColor = .white
    }
    
    private func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationItem.largeTitleDisplayMode = .automatic
        navController.navigationBar.accessibilityIdentifier = "page title"
        rootViewController.navigationItem.title = title
        rootViewController.title = title
        return navController
    }
    
    func setupViewControllers() {
        let profileViewController = ProfileViewController()
        let goodsListViewController = GoodsListViewController()
        let cartViewController = CartViewController()
        viewControllers = [
            createNavController(
                for: profileViewController,
                title: "Profile",
                image: UIImage(systemName: "person")!
            ),
            createNavController(
                for: goodsListViewController,
                title: "Catalog",
                image: UIImage(systemName: "list.bullet.rectangle.portrait")!
            ),
            createNavController(
                for: cartViewController,
                title: "Cart",
                image: UIImage(systemName: "cart")!
            )
        ]
    }
}
