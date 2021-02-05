//
//  WindowController.swift
//  JSON2Swift
//
//  Created by Justin Bush on 2021-02-04.
//

import Cocoa

var modelName = "App Data"
class WindowController: NSWindowController, NSWindowDelegate, NSToolbarDelegate, NSTextFieldDelegate {
    
    @IBOutlet weak var nameField: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        window!.delegate = self
        window!.isMovableByWindowBackground  = true
        //window!.titlebarAppearsTransparent = true
        window!.title = "JSON → Swift"
        
        nameField.delegate = self
    }
    
    @IBAction func generateButtonAction(_ sender: Any) {
        NotificationCenter.default.post(name: .willGenerateSwift, object: nil)
    }
    
    @IBAction func copyToClipboard(_ sender: Any) {
        NotificationCenter.default.post(name: .copyToClipboard, object: nil)
    }
    
    func updateModelName(_ name: String) {
        
        modelName = name
        
        if !modelName.isBlank() {
            NotificationCenter.default.post(name: .setModelName, object: nil)
        }
    }
    
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        if (commandSelector == #selector(NSResponder.insertNewline(_:))) {
            // Do something against ENTER key
            updateModelName(nameField.stringValue)
            return true
        }

        // return true if the action was handled; otherwise false
        return false
    }

}

extension ViewController {
    
    @objc func setModelName(_ notification: Notification) {
        run(Function.setModelName(modelName))
    }
    
    @objc func copyToClipboard(_ notification: Notification) {
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(outputCode.string, forType: .string)
    }

    @objc func generateSwift(_ notification: Notification) {
        progressBar.startAnimation(self)
        
        if debug { print("Inserting JSON") }
        
        let json = jsonCode.string
        run(Script.insertJSON(json))
        //run(Function.insertJSON(json))
        
        if debug { print("Generating Swift") }
    }
    
}
