//
//  WindowController.swift
//  JSON2Swift
//
//  Created by Justin Bush on 2021-02-04.
//

import Cocoa

class WindowController: NSWindowController, NSWindowDelegate, NSToolbarDelegate {

    @IBOutlet weak var generateButton: NSToolbarItem!
    
    @IBAction func generateButtonAction(_ sender: Any) {
        NotificationCenter.default.post(name: .willGenerateSwift, object: nil)
    }
    
    @IBAction func setCodeWelcome(_ sender: Any) {
        NotificationCenter.default.post(name: .willGenerateSwift, object: nil)
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        window!.delegate = self
        window!.isMovableByWindowBackground  = true
        //window!.titlebarAppearsTransparent = true
        //window!.titleVisibility = .hidden
        window!.title = "JSON → Swift"
    }

}
