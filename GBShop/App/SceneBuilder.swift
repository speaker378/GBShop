//
//  SceneBuilder.swift
//  GBShop
//
//  Created by Сергей Черных on 05.06.2022.
//

import UIKit

final class SceneBuilder {
    var window: UIWindow?
    var windowScene: UIWindowScene

    init(window: UIWindow?, windowScene: UIWindowScene) {
        self.window = window
        self.windowScene = windowScene
    }

    func begin() {
        let rootVC = LoginViewController()
        let navVC = UINavigationController()
        navVC.viewControllers = [rootVC]

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
}
