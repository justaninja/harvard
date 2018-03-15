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
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties
    var url: URL!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self

        let request = URLRequest(url: url)
        webView.load(request)
    }
}

// MARK: - WKNavigationDelegate
extension WebViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard !activityIndicator.isAnimating else { return }
        activityIndicator.startAnimating()
    }
}
