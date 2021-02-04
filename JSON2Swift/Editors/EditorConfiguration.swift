//
//  EditorConfiguration.swift
//  JSON2Swift
//
//  Created by Justin Bush on 2021-02-04.
//

import Cocoa

extension ViewController {
    
    func initEditors() {
        let font = NSFont(name: "SFMono-Regular", size: 12)
        //let attributes = NSDictionary(object: font!, forKey: NSAttributedString.Key.font as NSCopying)
        
        //jsonCode.typingAttributes = attributes
        //outputCode.typingAttributes = attributes
        
        jsonCode.font = font
        outputCode.font = font
        
        jsonCode.string = DefaultCode.json
        outputCode.string = DefaultCode.swift
    }
    
}

