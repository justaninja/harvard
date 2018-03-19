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

    /// The tab bar screens for the app.
    private let barScreens: [Screen] = [.collection, .magazine, .plan, .about]

    private var currentViewController: UIViewController

    // MARK: - Inits
    init(window: UIWindow) {
        self.window = window

        guard let rootViewController = window.rootViewController else {
            fatalError("There should be a controller")
        }

        currentViewController = rootViewController
    }

    // MARK: - Methods
    /// Setups the root view controller for the window.
    ///
    /// - Parameter controller: A new controller.
    func setupRootController(_ controller: UIViewController) {
        guard
            let mainViewController = controller as? MainViewController
            else { fatalError("There should be a controller") }

        mainViewController.viewControllers?.removeAll()
        mainViewController.screenCoordinator = self

        window.rootViewController = mainViewController

        barScreens.forEach { screen in
            let controller = UINavigationController()
            controller.view.backgroundColor = UIColor.white
            controller.isNavigationBarHidden = true
            controller.tabBarItem = screen.barItem

            mainViewController.viewControllers?.append(controller)
        }

        transition(toBar: 0)
    }

    /// Sets a screen for a tab bar item.
    ///
    /// - Parameter index: A tab bar index.
    func transition(toBar index: Int) {
        guard
            let mainController = window.rootViewController as? MainViewController,
            let navigationControllers = mainController.viewControllers,
            navigationControllers[index].childViewControllers.isEmpty
            else { return }

        currentViewController = barScreens[index].controller

        navigationControllers[index].show(currentViewController, sender: nil)
    }
}
