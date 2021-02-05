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
        jsonCode.font = font
        outputCode.font = font
        
        jsonCode.string = DefaultCode.json
        outputCode.string = DefaultCode.swift
    }
    
}

// MARK:- Lorem Ipsum Code

struct DefaultCode {
    
    static let json = """
    {
      "description": {
        "title": "Contiguous U.S., Average Temperature",
        "units": "Degrees Fahrenheit",
        "base_period": "1901-2000"
      },
      "data": {
        "189512": {
          "value": "50.34",
          "anomaly": "-1.68"
        },
        "189612": {
          "value": "51.99",
          "anomaly": "-0.03"
        },
        "189712": {
          "value": "51.56",
          "anomaly": "-0.46"
        }
      }
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
        let welcomeDescription: Description
        let data: [String: Datum]

        enum CodingKeys: String, CodingKey {
            case welcomeDescription = "description"
            case data
        }
    }

    // MARK: - Datum
    struct Datum: Codable {
        let value, anomaly: String
    }

    // MARK: - Description
    struct Description: Codable {
        let title, units, basePeriod: String

        enum CodingKeys: String, CodingKey {
            case title, units
            case basePeriod = "base_period"
        }
    }
    """
}
