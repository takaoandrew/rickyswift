//
//  ConnectionsTableViewController.swift
//  RolodexSwift
//
//  Created by Andrew Takao on 6/26/17.
//  Copyright © 2017 Andrew Takao. All rights reserved.
//

import UIKit


extension ConnectionsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
}

class ConnectionsTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var connections = [String]()
    
    var filteredConnections = [String]()
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredConnections = connections.filter { connection in
            return connection.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connections = ["Johnny", "Jimmy", "Peter", "Susan"]
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
    }
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredConnections.count
        }
        else {
            return connections.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionCell", for: indexPath)
        let connection: String
        if searchController.isActive && searchController.searchBar.text != "" {
            connection = filteredConnections[indexPath.row]
        }
        else {
            connection = connections[indexPath.row]
        }
        cell.textLabel!.text = connection
        
        return cell
    }

}
