//
//  DetailViewController.swift
//  Kangaroo
//
//  Created by Frank Cheng on 2019/5/23.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {
    
    enum Mode {
        case add
    }
    
    
    var mode: Mode! {
        didSet {
            if oldValue == nil {
                let vc = AddRecordViewController(nibName: "AddRecordViewController", bundle: nil)
                addChild(vc)
                
                view.addSubview(vc.view.useAutolayout())
                vc.view.sameSizeAsParent()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        mode = .add
    }
}
