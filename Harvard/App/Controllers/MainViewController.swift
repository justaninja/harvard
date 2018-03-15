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
    private let screens: [Screen] = [.collection, .magazine, .about]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers?.removeAll()

        screens.forEach { screen in
            guard let controller = screen.controller else { return }
            controller.tabBarItem = screen.barItem
            viewControllers?.append(controller)
        }
    }
}
