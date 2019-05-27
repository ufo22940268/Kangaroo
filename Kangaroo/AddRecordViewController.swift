//
//  AddRecordViewController.swift
//  Kangaroo
//
//  Created by Frank Cheng on 2019/5/24.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Cocoa
import RealmSwift

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

    @IBOutlet weak var saveButton: NSButton!
    @IBOutlet weak var keyFields: NSStackView!
    
    @IBOutlet weak var hostField: NSTextField!
    @IBOutlet weak var usernameField: NSTextField!
    @IBOutlet weak var passwordField: NSTextField!
    
    lazy var realm: Realm = {
       return try! Realm()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isAllFieldsValid() -> Bool {
        let fields: [NSTextField] = [hostField, usernameField, passwordField]
        guard (fields.allSatisfy { $0.stringValue.count > 0 }) else {
            return false
        }

        return hostField.stringValue.isURL()
    }
    
    @IBAction func onSave(_ sender: Any) {
        print("onSave")
        let host = hostField.stringValue
        let username = usernameField.stringValue
        let password = passwordField.stringValue
        
        let record = Record()
        record.host = host
        record.username = username
        record.password = password
        try! realm.write {
            realm.add(record)
        }
    }
}

extension AddRecordViewController: NSTextFieldDelegate {

    func controlTextDidChange(_ obj: Notification) {
        saveButton.isEnabled = isAllFieldsValid()
    }
}
