//
//  CapitalImageView.swift
//  Kangaroo
//
//  Created by Frank Cheng on 2019/5/24.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Cocoa

class CenterTextFieldCell: NSTextFieldCell {
    override func drawingRect(forBounds rect: NSRect) -> NSRect {
        let newRect = NSRect(x: 0, y: (rect.size.height - 22) / 2, width: rect.size.width, height: 22)
        return super.drawingRect(forBounds: newRect)
    }
}

class CapitalImageView: NSView {
    
    var cacheLabel: NSTextField!
    
    var capital: String! {
        didSet {
            cacheLabel = NSTextField(frame: bounds)
            cacheLabel.cell = CenterTextFieldCell()
            cacheLabel.stringValue = capital
            cacheLabel.wantsLayer = true
            cacheLabel.textColor = .white
            cacheLabel.alignment = .center
            cacheLabel.font = NSFont.boldSystemFont(ofSize: 19)
            setNeedsDisplay(bounds)
        }
    }
    
    override func awakeFromNib() {
        wantsLayer = true
        layer?.cornerRadius = 4
    
        layer?.backgroundColor = NSColor.textBackgroundColor.cgColor
        
        capital = "A"
    }
    
    func getImage(for text: String) -> NSImage {
        guard let context = NSGraphicsContext.current?.cgContext else { fatalError() }
        context.addRect(bounds)
        context.setFillColor(NSColor.yellow.cgColor)
        context.fill(bounds)
        return NSImage(cgImage: context.makeImage()!, size: bounds.size)
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        guard let label = cacheLabel else { return }
        label.draw(dirtyRect)
    }
}
