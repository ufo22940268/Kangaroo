//
//  RecordListViewController.swift
//  Kangaroo
//
//  Created by Frank Cheng on 2019/5/23.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Cocoa

class RecordListViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView! {
        didSet {
            tableView.register(NSNib(nibNamed: "RecordCell", bundle: nil), forIdentifier: id)
        }
    }
    let id =  NSUserInterfaceItemIdentifier("cell")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension RecordListViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return "adfasdfij"
    }
}

extension RecordListViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let view = tableView.makeView(withIdentifier: id, owner: nil) as! RecordCell
        view.title.stringValue = "jiji"
        return view
    }
        
    func tableView(_ tableView: NSTableView, isGroupRow row: Int) -> Bool {
        return false
    }
}
