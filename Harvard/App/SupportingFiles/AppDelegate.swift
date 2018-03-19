//
//  AppDelegate.swift
//  Harvard
//
//  Created by Konstantin Khokhlov on 14.03.2018.
//  Copyright © 2018 Constantine. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        guard let window = window else { fatalError("There should be a window") }

        let coordinator = ScreenCoordinator(window: window)
        coordinator
            .setRootController(UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "Main"))
        return true
    }
}
