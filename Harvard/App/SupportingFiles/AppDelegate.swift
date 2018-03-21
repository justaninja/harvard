//
//  AppDelegate.swift
//  Harvard
//
//  Created by Konstantin Khokhlov on 14.03.2018.
//  Copyright © 2018 Constantine. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        guard let window = window else { fatalError("There should be a window") }

        let container = Container()

        container
            .register(ScreenCoordinator.self) { _ in  ScreenCoordinator(window: window, container: container) }

        container
            .register(MainViewController.self) { r in
                let controller = R.storyboard.main.mainController()
                controller?.screenCoordinator = r.resolve(ScreenCoordinator.self)
                return controller!
        }

        container
            .register(WebViewController.self) { _ in R.storyboard.web.webController()! }

        let mainController = container.resolve(MainViewController.self)!

        container
            .resolve(ScreenCoordinator.self)?
            .setupRootController(mainController)

        return true
    }
}
