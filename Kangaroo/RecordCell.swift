//
//  RecordCell.swift
//  Kangaroo
//
//  Created by Frank Cheng on 2019/5/23.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Cocoa

class RecordCell: NSTableCellView {

    @IBOutlet weak var title: NSTextField!
    @IBOutlet weak var subtitle: NSTextFieldCell!
    @IBOutlet weak var capital: CapitalImageView!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
    }
    
}
