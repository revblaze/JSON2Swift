//
//  Notifications.swift
//  JSON2Swift
//
//  Created by Justin Bush on 2021-02-04.
//

import Cocoa

extension ViewController {
    
    func notificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.generateSwift(_:)), name: .willGenerateSwift, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.copyToClipboard(_:)), name: .copyToClipboard, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.setModelName(_:)), name: .setModelName, object: nil)
    }
    
}


// MARK: Extensions
extension Notification.Name {
    static let willGenerateSwift = Notification.Name("willGenerateSwift")
    static let copyToClipboard = Notification.Name("copyToClipboard")
    static let setModelName = Notification.Name("setModelName")
}





//struct Notif {
//    
//    static let generateCode = Notification.Name("generateCode")
//    static let copyToClipboard = Notification.Name("copyToClipboard")
//    
//}
//
//enum Notifications {
//    
//    case generateCode
//    case copyToClipboard
//    
//    var name: Notification.Name {
//        switch self {
//        case .generateCode:     return Notification.Name("generateCode")
//        case .copyToClipboard:  return Notification.Name("copyToClipboard")
//        }
//    }
//    
//}


