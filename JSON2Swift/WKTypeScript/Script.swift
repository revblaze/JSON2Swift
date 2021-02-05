//
//  Script.swift
//  JSON2Swift
//
//  Created by Justin Bush on 2021-02-04.
//

import Foundation

// MARK: Script Database
/// `enum:` A  written database of scripts for type-safe calling of JavaScript functions
enum Script {
    
    // MARK: Global Functions
    case setupAceEditor
    case getCode
    
    /// Insert JSON into the Ace Editor
    /// # Usage
    ///     let json = Script.insertJSON(jsonString)
    ///     run(json)
    static func insertJSON(_ json: String) -> String {
        return "insertJSON(\(json));"
    }
    
    /// Name of JavaScript function to call for execution on a webView
    /// # Usage
    ///     run(_ script: Script) { ... }
    ///     run(.addMenuCode)
    var name: String {
        switch self {
        case .setupAceEditor:   return "jsonTextEditor = ace.edit('source'); outputTextEditor = ace.edit('output');"
        case .getCode:          return "getCode();"
        }
    }
    
}

// MARK: Function Callers
/// `struct:` A  written database of scripts for type-safe calling of JavaScript functions
struct Function {
    
    static let setupAceEditor = "var jsonTextEditor = ace.edit('source'); var outputTextEditor = ace.edit('output');"
    static let getCode = "getCode();"
    
    /// Insert JSON into Ace Editor
    /// # Usage
    ///     run(Function.) { ... }
    ///     run(.addMenuCode)
    static func insertJSON(_ json: String) -> String {
        return "insertJSON(\(json));"
    }
    
    static func setModelName(_ name: String) -> String {
        return "document.getElementsByClassName(\"bp3-input\")[0].value = \"\(name)\";"
    }
    
}
