//
//  DetailViewController.swift
//  Kangaroo
//
//  Created by Frank Cheng on 2019/5/23.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Cocoa

typealias DetailSplitDelegate = AddRecordViewControllerDelegate

class DetailViewController: NSViewController {
    
    enum Mode {
        case add
    }
    
    weak var splitDelegate: DetailSplitDelegate?
    
    var mode: Mode! {
        didSet {
            if oldValue == nil {
                let vc = AddRecordViewController(nibName: "AddRecordViewController", bundle: nil)
                vc.delegate = splitDelegate
                addChild(vc)
                
                view.addSubview(vc.view.useAutolayout())
                vc.view.sameSizeAsParent()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
