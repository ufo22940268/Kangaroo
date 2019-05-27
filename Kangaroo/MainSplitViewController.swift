//
//  MainSplitViewController.swift
//  Kangaroo
//
//  Created by Frank Cheng on 2019/5/23.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Cocoa

class MainSplitViewController: NSSplitViewController {

    @IBOutlet weak var recordListItem: NSSplitViewItem!
    @IBOutlet weak var detailItem: NSSplitViewItem!
    
    var recordListVC: RecordListViewController {
        return recordListItem.viewController as! RecordListViewController
    }
    
    var detailVC: DetailViewController {
        return detailItem.viewController as! DetailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordListVC.splitDelegate = self
        detailVC.splitDelegate = self
        
        detailVC.mode = .add
    }
}

extension MainSplitViewController: RecordListViewControllerDelegate {
    func addRecord() {
        detailVC.mode = .add
    }
}

extension MainSplitViewController: DetailSplitDelegate {
    func onCommitAddRecord() {
        recordListVC.loadData()
    }
}
