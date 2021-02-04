//
//  ViewController.swift
//  Example
//
//  Created by Justin Bush on 2020-12-19.
//

import Cocoa
import WebKit

/// Enables debug functions and console logs when `true`
let debug = true

class ViewController: NSViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    
    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        clearCache()
        initWebView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didToggleMode(_:)), name: .didToggleMode, object: nil)
        
    }
    
    // MARK: WebKit Config
    /// Initializes the main WKWebView object.
    func initWebView() {
        webView.uiDelegate = self                           // Set WebView UI Delegate
        webView.navigationDelegate = self                   // Set WebView Navigation Delegate
        // JavaScript Event Listeners
        webView.configuration.userContentController.add(self, name: "eventListeners")
        webView.load(file: "index", path: "WebContent")
    }
    /// Clear WebKit WebView object cache.
    func clearCache() {
        let websiteDataTypes = NSSet(array: [WKWebsiteDataTypeDiskCache, WKWebsiteDataTypeMemoryCache])
        let date = Date(timeIntervalSince1970: 0)
        WKWebsiteDataStore.default().removeData(ofTypes: websiteDataTypes as! Set<String>, modifiedSince: date, completionHandler:{ })
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        run(JS.get())
    }
    
    
    // MARK: JavaScript Handler
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // JavaScript event listeners
    }
    
    @objc func didToggleMode(_ notification: Notification) {
        run("toggleMode();")
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

// MARK: Notification Extensions
extension Notification.Name {
    static let didToggleMode = Notification.Name("didToggleMode")
}

