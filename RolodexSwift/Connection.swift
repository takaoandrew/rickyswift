//
//  Connection.swift
//  RolodexSwift
//
//  Created by Andrew Takao on 7/27/17.
//  Copyright © 2017 Andrew Takao. All rights reserved.
//

import UIKit
import Foundation

class Connection: NSObject {

    var name : String
    var group : String
    
    init(name: String, group: String) {
        self.name = name
        self.group = group
    }
}
