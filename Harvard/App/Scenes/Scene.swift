//
//  Scene.swift
//  Harvard
//
//  Created by Konstantin Khokhlov on 14.03.2018.
//  Copyright © 2018 Constantine. All rights reserved.
//

import UIKit

/// Represents screens for the app.
///
/// - highlights: Collection screen.
/// - magazine: Magazine screen.
enum Scene: String {

    case collection, magazine

    private var storyboard: UIStoryboard {
        return UIStoryboard(name: rawValue.capitalized, bundle: nil)
    }

    var title: String {
        return rawValue.capitalized
    }

    var controller: UIViewController? {
        return storyboard.instantiateInitialViewController()
    }

    var barItem: UITabBarItem {
        return UITabBarItem(title: title, image: nil, selectedImage: nil)
    }

}
