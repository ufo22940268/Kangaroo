//
//  RecordListViewController.swift
//  Kangaroo
//
//  Created by Frank Cheng on 2019/5/23.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Cocoa

protocol RecordListViewControllerDelegate: class {
    func addRecord()
}

class RecordListViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView! {
        didSet {
            tableView.register(NSNib(nibNamed: "RecordCell", bundle: nil), forIdentifier: NSUserInterfaceItemIdentifier("cell"))
        }
    }

    weak var splitDelegate: RecordListViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func onAdd(_ sender: NSButton) {
        splitDelegate?.addRecord()
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
        let view = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("cell"), owner: nil) as! RecordCell
        view.title.stringValue = "jiji"
        return view
    }
        
    func tableView(_ tableView: NSTableView, isGroupRow row: Int) -> Bool {
        return false
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        let id = NSUserInterfaceItemIdentifier("rowView")
        var rowView = tableView.makeView(withIdentifier: id, owner: nil) as? NSTableRowView
        if rowView == nil {
            let recordCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("cell"), owner: nil) as! RecordCell
            let paddingLeft = recordCell.title.convert(recordCell.title.bounds, to: recordCell).minX
            rowView = IOSLikeRowView(paddingLeft: paddingLeft)
            rowView?.identifier = id
        }
        return rowView
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 50        
    }
}

class IOSLikeRowView: NSTableRowView {
    
    var paddingLeft: CGFloat!
    
    init(paddingLeft: CGFloat) {
        super.init(frame: .zero)
        self.paddingLeft = paddingLeft
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawSeparator(in dirtyRect: NSRect) {
        let path = NSBezierPath()
        NSColor.separatorColor.setStroke()
        path.move(to: NSPoint(x: paddingLeft, y: 0))
        path.line(to: NSPoint(x: bounds.width, y: 0))
        path.lineWidth = 2
        path.stroke()
    }
}
