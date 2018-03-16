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

    // MARK: - Inits
    init(window: UIWindow) {
        self.window = window
    }

    // MARK: - Methods
    func setRootController(_ controller: UIViewController) {
        window.rootViewController = controller
    }
}
