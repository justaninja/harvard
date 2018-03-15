//
//  MagazineViewController.swift
//  Harvard
//
//  Created by Konstantin Khokhlov on 14.03.2018.
//  Copyright © 2018 Constantine. All rights reserved.
//

import UIKit
import WebKit

class MagazineViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: "https://www.harvardartmuseums.org/index-magazine") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
