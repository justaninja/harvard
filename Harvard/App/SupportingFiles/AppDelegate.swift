//
//  AppDelegate.swift
//  Harvard
//
//  Created by Konstantin Khokhlov on 14.03.2018.
//  Copyright © 2018 Constantine. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        guard let window = window else { fatalError("There should be a window") }

        let container = Container()

        container.register(ScreenCoordinator.self) { _ in  ScreenCoordinator(window: window) }

        container.storyboardInitCompleted(MainViewController.self) { r, c in
            c.screenCoordinator = r.resolve(ScreenCoordinator.self)
        }

        container.storyboardInitCompleted(WebViewController.self) { (_, _) in }

        container
            .resolve(ScreenCoordinator.self)?
            .setupRootController(SwinjectStoryboard
                .create(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "Main"))

        return true
    }
}
