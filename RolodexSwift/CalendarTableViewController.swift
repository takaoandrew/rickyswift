//
//  CalendarTableViewController.swift
//  RolodexSwift
//
//  Created by Andrew Takao on 6/20/17.
//  Copyright © 2017 Andrew Takao. All rights reserved.
//

import UIKit

class CalendarTableViewController: UITableViewController {
    
    var timesOfDay: [String]?
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
////        tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), tag: 0)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timesOfDay = ["1 AM", "2 AM", "3 AM", "4 AM", "5 AM", "6 AM",
        "7 AM", "8 AM", "9 AM", "10 AM", "11 AM", "12 PM",
        "1 PM", "2 PM", "3 PM", "4 PM", "5 PM", "6 PM",
        "7 PM", "8 PM", "9 PM", "10 PM", "11 PM", "12 AM"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let timesOfDay = timesOfDay {
            return timesOfDay.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let timeOfDay = timesOfDay?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeCell", for: indexPath)
        if let timeOfDay = timeOfDay {
            cell.textLabel?.text = timeOfDay
        }
        return cell
    }
    
    
    

}
