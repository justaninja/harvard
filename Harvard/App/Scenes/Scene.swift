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
/// - highlights: Highlights screen.
/// - magazine: Magazine screen.
enum Scene: String {

    case highlights, magazine

    var storyboard: UIStoryboard {
        return UIStoryboard(name: self.rawValue.uppercased(), bundle: nil)
    }
}
