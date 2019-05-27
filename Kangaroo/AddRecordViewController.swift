//
//  AddRecordViewController.swift
//  Kangaroo
//
//  Created by Frank Cheng on 2019/5/24.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Cocoa

class BorderBox: NSBox {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let path = NSBezierPath()
        path.move(to: .zero)
        path.line(to: NSPoint(x: bounds.width, y: 0))
        path.lineWidth = 2
        NSColor.separatorColor.setStroke()
        path.move(to: NSPoint(x: 0, y: bounds.height))
        path.line(to: NSPoint(x: bounds.width, y: bounds.height))
        path.stroke()
    }
}

class AddRecordViewController: NSViewController {

    @IBOutlet weak var keyFields: NSStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.        
    }
    
}
