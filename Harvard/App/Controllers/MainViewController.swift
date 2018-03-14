//
//  MainViewController.swift
//  Harvard
//
//  Created by Konstantin Khokhlov on 14.03.2018.
//  Copyright © 2018 Constantine. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers?.removeAll()

        let collection = Scene.collection
        if let collectionController = collection.controller {
            collectionController.tabBarItem = collection.barItem
            viewControllers?.append(collectionController)
        }

        let magazine = Scene.magazine
        if let magazineViewController = magazine.controller {
            magazineViewController.tabBarItem = magazine.barItem
            viewControllers?.append(magazineViewController)
        }
    }
}
