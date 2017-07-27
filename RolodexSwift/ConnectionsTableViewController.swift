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

extension ConnectionsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

class ConnectionsTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var connections = [Connection]()
    
    var filteredConnections = [Connection]()
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredConnections = connections.filter { connection in
            let groupMatch = (scope == "All") || (connection.group == scope)
            return  groupMatch && connection.name.lowercased().contains(searchText.lowercased()) ||
                connection.group.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connections = [
            Connection(name:"Ricky Schaberg", group:"Promoter"),
            Connection(name:"Andrew Takao", group:"Coder"),
            Connection(name:"Timothy Takao", group:"Salesman"),
            Connection(name:"Matthew Takao", group:"Engineer"),
            Connection(name:"Jackie Chan", group:"Actor")
        ]
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
        let connection: Connection
        if searchController.isActive && searchController.searchBar.text != "" {
            connection = filteredConnections[indexPath.row]
        }
        else {
            connection = connections[indexPath.row]
        }
        cell.textLabel!.text = connection.name
        cell.detailTextLabel?.text = connection.group
        
        return cell
    }

}
