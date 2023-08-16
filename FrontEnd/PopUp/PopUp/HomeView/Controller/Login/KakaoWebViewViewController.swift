//
//  KakaoWebViewViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/16.
//

import UIKit
import WebKit
import Alamofire

class KakaoWebViewViewController: UIViewController, WKNavigationDelegate{
    
    
    @IBOutlet var webView: WKWebView!
    private let urlString = "https://kauth.kakao.com/oauth/authorize?client_id=30c61fb2b10bc34b30554c869bab2ad3&redirect_uri=http://13.209.9.10/member/signup/kakao&response_type=code"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    func extractCode(from url: String) -> String? {
        if let range = url.range(of: "code=") {
            let startIndex = range.upperBound
            let code = String(url[startIndex...])
            return code
        }
        return nil
    }
    
    // WKNavigationDelegate methods
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        // Handle error during navigation
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let defaults = UserDefaults.standard
        
        if let currentURL = webView.url?.absoluteString,
               currentURL.hasPrefix("http://13.209.9.10/member/signup/kakao?code="),
           let code = extractCode(from: currentURL) {
            
            
            print("\n\n\n\n\n")
            UserDefaults.standard.set(code, forKey: "token")
            // Dismiss the current view controller (web view)
            if let savedToken = UserDefaults.standard.string(forKey: "token") {
                // Use the savedToken for further processing
                defaults.set(true, forKey: "isLoggedIn")
                print("Saved Token: \(savedToken)")
            } else {
                // No token found
                defaults.set(false, forKey: "isLoggedIn")
                print("No token saved")
            }
            print("\n\n\n\n\n")
            self.dismiss(animated: true, completion: nil)
        }
    }
}
