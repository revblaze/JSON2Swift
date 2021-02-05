//
//  WKConfiguration.swift
//  JSON2Swift
//
//  Created by Justin Bush on 2021-02-04.
//

import Cocoa
import WebKit

// MARK: WebView Configuration
extension ViewController {
    
    /// Initialize main `WebView` client for UWeb
    func initWebView() {
        webView.uiDelegate = self                           // Set WebView UI Delegate
        webView.navigationDelegate = self                   // Set WebView Navigation Delegate
        webView.allowsLinkPreview = false                   // Disable Link Preview
        webView.allowsMagnification = false                 // Disable Magnification
        webView.allowsBackForwardNavigationGestures = false // Disable Back-Forward Gestures
        // JavaScript Event Listeners
        webView.configuration.userContentController.add(self, name: "eventListeners")
        // Load QuickType
        webView.load("https://app.quicktype.io/")
    }
    
    func clearCache() {
        let websiteDataTypes = NSSet(array: [WKWebsiteDataTypeDiskCache, WKWebsiteDataTypeMemoryCache])
        let date = Date(timeIntervalSince1970: 0)
        WKWebsiteDataStore.default().removeData(ofTypes: websiteDataTypes as! Set<String>, modifiedSince: date, completionHandler:{ })
    }
}
