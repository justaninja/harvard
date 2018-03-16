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
/// - plan: Plan screen.
/// - about: About screen.
enum Screen: String {

    case collection, magazine, plan, about

    private var storyboard: UIStoryboard {
        return UIStoryboard(name: "Web", bundle: nil)
    }

    private var url: URL? {
        switch self {
        case .collection:
            return URL(string: "https://www.harvardartmuseums.org/collections?")
        case .magazine:
            return URL(string: "https://www.harvardartmuseums.org/index-magazine")
        case .about:
            return URL(string: "https://www.harvardartmuseums.org/about")
        case .plan:
            return URL(string: "https://www.harvardartmuseums.org/visit/floor-plan/1")
        }
    }

    private var barImage: UIImage? {
        return UIImage(named: "\(rawValue)_gray")
    }

    var title: String {
        return rawValue.capitalized
    }

    var controller: UIViewController? {
        let controller = storyboard.instantiateInitialViewController()
        (controller as? WebViewController)?.url = url
        return controller
    }

    var barItem: UITabBarItem {
        return UITabBarItem(title: nil, image: barImage, selectedImage: nil)
    }
}
