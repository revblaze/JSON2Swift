//
//  ViewController.swift
//  JSON2Swift
//
//  Created by Justin Bush on 2021-02-04.
//

import Cocoa
import WebKit

/// When `true`, enables debug functions and console logs
let debug = true

class ViewController: NSViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var jsonCode: NSTextView!
    @IBOutlet weak var outputCode: NSTextView!
    @IBOutlet weak var progressBar: NSProgressIndicator!
    
    var tempCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationObservers()
        
        initEditors()
        initWebView()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //run(JS.get(file: "custom"))
        run(JS.get())
        run(Function.setupAceEditor)
    }
    
    // MARK:- JSON Messaging
    var codeFlag = false
    var searchFlag = false
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "eventListeners" {
            if let message = message.body as? String {
                if debug { print("> \(message)") }
                
                if codeFlag {
                    outputCode.string = message
                    codeFlag = false
                    progressBar.stopAnimation(self)
                }
                
                if message.contains("[ACE] SUCCESS") {
                    codeFlag = true
                }
                
                if message.contains("[ACE] ERROR") {
                    //outputCode.string = message
                    //codeFlag = true
                    print("WebKit returned error")
                    progressBar.stopAnimation(self)
                    
                }
                
                if searchFlag {
                    outputCode.string = message
                    searchFlag = false
                }
                
                if message.contains("[ACE] BUFFER") {
                    searchFlag = true
                }
            }
        }
    }
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}



