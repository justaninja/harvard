//
//  MainViewController.swift
//  Harvard
//
//  Created by Konstantin Khokhlov on 14.03.2018.
//  Copyright © 2018 Constantine. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    var screenCoordinator: ScreenCoordinator?

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard
            let index = tabBar.items?.index(of: item)
            else { return }

        screenCoordinator?.transition(to: index)
    }
}
