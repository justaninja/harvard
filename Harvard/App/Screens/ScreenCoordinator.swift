//
//  ScreenCoordinator.swift
//  Harvard
//
//  Created by Konstantin Khokhlov on 16.03.2018.
//  Copyright © 2018 Constantine. All rights reserved.
//

import UIKit

class ScreenCoordinator {

    // MARK: - Properties
    private var window: UIWindow
    private let screens: [Screen] = [.collection, .magazine, .plan, .about]

    // MARK: - Inits
    init(window: UIWindow) {
        self.window = window
    }

    // MARK: - Methods
    func setRootController(_ controller: UIViewController) {
        window.rootViewController = controller

        guard
            let mainController = window.rootViewController as? MainViewController
            else { fatalError("There should be a controller") }
        mainController.viewControllers?.removeAll()
        mainController.screenCoordinator = self

        screens.forEach { screen in
            let controller = UINavigationController()
            controller.view.backgroundColor = UIColor.white
            controller.isNavigationBarHidden = true
            controller.tabBarItem = screen.barItem
            mainController.viewControllers?.append(controller)
        }
        transition(to: 0)
    }

    func transition(to screenIndex: Int) {
        guard
            let mainController = window.rootViewController as? MainViewController,
            let navigationControllers = mainController.viewControllers,
            navigationControllers[screenIndex].childViewControllers.isEmpty
            else { return }

        navigationControllers[screenIndex].show(screens[screenIndex].controller, sender: nil)
    }
}
