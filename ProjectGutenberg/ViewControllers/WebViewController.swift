//
//  WebViewController.swift
//  ProjectGutenberg
//
//  Created by Sourabh Kumbhar on 15/10/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var webView: WKWebView?
    
    public var urlString = ""
    public var navigationTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    private func setupNavigationBar() {
        self.title = navigationTitle
    }

    private func setupWebView() {
        guard let url = URL(string: urlString) else {
            return
        }
        webView?.navigationDelegate = self
        let urlRequest = URLRequest(url: url)
        webView?.load(urlRequest)
    }
    
    @objc func backBtnTapp() {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
}

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //self.showPurpleIndicator()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //self.hidePurpleIndicator()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        //self.hidePurpleIndicator()
        //self.view.showErrorCardView(message: error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        //self.hidePurpleIndicator()
        //self.view.showErrorCardView(message: error.localizedDescription)
    }
}
