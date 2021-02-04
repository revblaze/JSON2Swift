//
//  Script.swift
//  JSON2Swift
//
//  Created by Justin Bush on 2021-02-04.
//

import Foundation

// MARK: Script Database
/// An enumerated database of scripts for type-safe calling of JavaScript functions
enum Script {
    
    // MARK: Global Functions
    case setupAceEditor
    
    /// Name of JavaScript function to call for execution on a webView
    /// # Usage
    ///     run(_ script: Script) { ... }
    ///     run(.addMenuCode)
    var name: String {
        switch self {
        case .setupAceEditor:   return "jsonTextEditor = ace.edit('source'); outputTextEditor = ace.edit('output');"
        }
    }
    
}

struct Function {
    static let setupAceEditor = "var jsonTextEditor = ace.edit('source'); var outputTextEditor = ace.edit('output');"
    
    static let getCode = "getOutputCode();"//"getCode();"
    
    static func insertJSON(_ json: String) -> String {
        return "insertJSON(\(json));"
    }
}
