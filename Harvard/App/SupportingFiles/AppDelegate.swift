//
//  AppDelegate.swift
//  Harvard
//
//  Created by Konstantin Khokhlov on 14.03.2018.
//  Copyright © 2018 Constantine. All rights reserved.
//

import UIKit
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        guard let window = window else { fatalError("There should be a window") }

        let defaultContainer = SwinjectStoryboard.defaultContainer
        let coordinator = ScreenCoordinator(window: window)

        defaultContainer.register(ScreenCoordinator.self) { _ in  coordinator }

        defaultContainer.storyboardInitCompleted(MainViewController.self) { r, c in
            c.screenCoordinator = r.resolve(ScreenCoordinator.self)!
        }

        defaultContainer.storyboardInitCompleted(WebViewController.self) { (_, _) in }

        coordinator
            .setupRootController(SwinjectStoryboard
                .create(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "Main"))

        return true
    }
}
