//
//  ConnectionsTableViewController.swift
//  RolodexSwift
//
//  Created by Andrew Takao on 6/26/17.
//  Copyright © 2017 Andrew Takao. All rights reserved.
//

import UIKit

class ConnectionsTableViewController: UITableViewController {

//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
////        tabBarItem = UITabBarItem(title: "Connections", image: UIImage(named: "connections"), tag: 1)
//    }
    
    var connections: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connections = ["Johnny", "Jimmy", "Peter", "Susan"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let connections = connections {
            return connections.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let connection = connections?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionCell", for: indexPath)
        if let connection = connection {
            cell.textLabel?.text = connection
        }
        return cell
    }

}
