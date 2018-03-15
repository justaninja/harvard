//
//  WebViewController.swift
//  Harvard
//
//  Created by Konstantin Khokhlov on 15.03.2018.
//  Copyright © 2018 Constantine. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var webView: WKWebView!

    // MARK: - Properties
    var url: URL!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = URLRequest(url: url)
        webView.load(request)
    }
}
