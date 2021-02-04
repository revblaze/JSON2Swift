//
//  EditorCode.swift
//  JSON2Swift
//
//  Created by Justin Bush on 2021-02-04.
//

import Foundation

enum EditorCode {
    
    case welcome
    case pokedex
    case temperatures
    
    var json: String {
        switch self {
        case .welcome:      return DefaultCode.welcomeJSON
        case .pokedex:      return DefaultCode.pokedexJSON
        case .temperatures: return DefaultCode.temperatureJSON
        }
    }
    
}


struct DefaultCode {
    static let json = """
    {
      "greeting": "Welcome to quicktype!",
      "instructions": [
        "Type or paste JSON here",
        "Or choose a sample above",
        "quicktype will generate code in your",
        "chosen language to parse the sample data"
      ]
    }
    """
    
    static let welcomeJSON = """
    {
      "greeting": "Welcome to quicktype!",
      "instructions": [
        "Type or paste JSON here",
        "Or choose a sample above",
        "quicktype will generate code in your",
        "chosen language to parse the sample data"
      ]
    }
    """
    
    static let pokedexJSON = """
    {
      "greeting": "Welcome to quicktype!",
      "instructions": [
        "Type or paste JSON here",
        "Or choose a sample above",
        "quicktype will generate code in your",
        "chosen language to parse the sample data"
      ]
    }
    """
    
    static let temperatureJSON = """
    {
      "greeting": "Welcome to quicktype!",
      "instructions": [
        "Type or paste JSON here",
        "Or choose a sample above",
        "quicktype will generate code in your",
        "chosen language to parse the sample data"
      ]
    }
    """
    
    static let swift = """
    // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

    import Foundation

    // MARK: - Welcome
    struct Welcome: Codable {
        let greeting: String
        let instructions: [String]
    }
    """
    
    //static let json
    
}
