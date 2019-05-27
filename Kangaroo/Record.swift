//
//  Record.swift
//  Kangaroo
//
//  Created by Frank Cheng on 2019/5/27.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Foundation
import RealmSwift

class Record: Object {
    @objc dynamic var host: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var createdDate: Date = Date()

    var simpleHost: String {
        return host.replacingOccurrences(of: #"(.+\.)?(.+\..+)"#, with: "$2", options: .regularExpression)
    }

    var capitalCharacter: String {
        if let first = host.first {
            return String([first])
        } else {
            return ""
        }
    }
}

