//
//  MainViewController.swift
//  Harvard
//
//  Created by Konstantin Khokhlov on 14.03.2018.
//  Copyright © 2018 Constantine. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    // MARK: - Properties
    private let screens: [Screen] = [.collection, .magazine, .plan, .about]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers?.removeAll()

        screens.forEach { screen in
            let controller = UINavigationController()
            controller.view.backgroundColor = UIColor.white
            controller.isNavigationBarHidden = true
            controller.tabBarItem = screen.barItem
            viewControllers?.append(controller)
        }
        viewControllers?.first?.addChildViewController(screens[0].controller!)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard
            let index = tabBar.items?.index(of: item),
            let rootViewController = viewControllers?[index],
            rootViewController.childViewControllers.isEmpty
            else { return }

        rootViewController.addChildViewController(screens[index].controller!)
        print(rootViewController.childViewControllers)
    }
}
