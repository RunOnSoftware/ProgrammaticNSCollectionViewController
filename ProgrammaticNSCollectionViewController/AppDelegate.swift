//
//  AppDelegate.swift
//  ProgramatticNSViewController
//
//  Created by John McKnight on 12/21/14.
//  Copyright (c) 2014 John McKnight. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var titles:NSArray = []
    
    weak var window: NSWindow!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        self.titles = ["Case", "Molly", "Armitage", "Hideo", "The Finn", "Maelcum", "Wintermute", "Neuromancer"]
        
        var cv:NSCollectionView = NSCollectionView(frame: self.window.contentView.frame)
        cv.itemPrototype = CCPrototype()
        cv.content = self.titles
        cv.autoresizingMask = NSAutoresizingMaskOptions.ViewMinXMargin | NSAutoresizingMaskOptions.ViewWidthSizable | NSAutoresizingMaskOptions.ViewMaxXMargin | NSAutoresizingMaskOptions.ViewMinYMargin | NSAutoresizingMaskOptions.ViewHeightSizable | NSAutoresizingMaskOptions.ViewMaxYMargin
        
        self.window.contentView.addSubview(cv)
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    
}

let buttonSize = NSSize(width: 80.0, height: 20.0)
let itemSize = NSSize(width: 100.0, height: 40.0)
let buttonOrigin = NSPoint(x: 10.0, y: 10.0)

class CCView: NSView {
    var button:NSButton?
    
    override init(frame frameRect: NSRect) {
        super.init(frame: NSRect(origin: frameRect.origin, size: itemSize))
        
        var newButton = NSButton(frame: NSRect(origin: buttonOrigin, size: buttonSize))
        self.addSubview(newButton)
        self.button = newButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CCPrototype: NSCollectionViewItem {
    override func loadView() {
        self.view = CCView(frame: NSZeroRect)
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
            if let view = self.view as? CCView {
                if representedObject != nil {
                    view.button!.title = representedObject! as String
                }
            }
        }
        
    }
}
