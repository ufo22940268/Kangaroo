//
//  RecordListViewController.swift
//  Kangaroo
//
//  Created by Frank Cheng on 2019/5/23.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Cocoa
import RealmSwift

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
    lazy var realm: Realm = {
       return try! Realm()
    }()
    var records: Results<Record>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        loadData()
    }
    
    func loadData() {
        records = realm.objects(Record.self).sorted(byKeyPath: "createdDate", ascending: false)
        tableView.reloadData()
    }
    
    @IBAction func onAdd(_ sender: NSButton) {
        splitDelegate?.addRecord()
    }
}

extension RecordListViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        guard let records = records, records.count > 0 else { return 0}
        return records.count
    }
}

extension RecordListViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let view = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("cell"), owner: nil) as! RecordCell
        let record = records![row]
        view.title.stringValue = record.host
        view.subtitle.stringValue = record.createdDate.format
        view.capital.capital = String(record.host.first!)
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
