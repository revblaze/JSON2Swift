//
//  AppDelegate.swift
//  JSON2Swift
//
//  Created by Justin Bush on 2021-02-04.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindow: NSWindow!
    @IBOutlet var debugMenu: NSMenuItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        mainWindow = NSApplication.shared.windows[0]
        NSApp.activate(ignoringOtherApps: true)
        //debugMenu.isHidden = !debug
    }
    
    // Handles Reopening of Main Window
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if !flag {
            for window in sender.windows {
                window.makeKeyAndOrderFront(self)
            }
        }
        return true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

