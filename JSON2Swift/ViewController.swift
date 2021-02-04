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
    var templateSelection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.generateSwift(_:)), name: .willGenerateSwift, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didChangeTemplate(_:)), name: .didChangeTemplate, object: nil)
        
        initEditors()
        initWebView()
    }
    
    override func viewDidAppear() {
        //progressBar.stopAnimation(self)
    }
    
    @objc func didChangeTemplate(_ notification: Notification) {
        print("Changed!")
    }

    @objc func generateSwift(_ notification: Notification) {
        progressBar.startAnimation(self)
        
        if debug { print("Inserting JSON") }
        
        let json = jsonCode.string
        run(Function.insertJSON(json))
        
        print("Generating Swift")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //self.run(Function.getCode)
            //self.tempCode = self.runWithResult(Function.getCode)
            /*
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.updateCode(self.tempCode)
            }
            */
        }
    }
    
    func updateCode(_ code: String) {
        //if code != tempCode { }
        outputCode.string = code
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        //run(JS.get())
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //run(JS.get(file: "custom"))
        
        run(JS.get())
        run(Function.setupAceEditor)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.run(Function.setupAceEditor)
//        }
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
                
                
                
                //handleJS(message)
            }
        }
    }
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}



// MARK: Extensions
extension Notification.Name {
    static let willGenerateSwift = Notification.Name("willGenerateSwift")
    static let didChangeTemplate = Notification.Name("didChangeTemplate")
}
