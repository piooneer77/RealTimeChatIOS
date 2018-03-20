//
//  NewMessageViewController.swift
//  GameOfChats
//
//  Created by Apple on 3/15/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class NewMessageViewController: UITableViewController {
    
    var usersList = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UserCell.self, forCellReuseIdentifier: AppConstants.userCellId)
        print("Loaded NewMessageViewController")
        setUpNavigationBarItems()
        getAllMembers()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usersList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.userCellId, for: indexPath)
        cell.textLabel?.text = usersList[indexPath.row].name
        cell.detailTextLabel?.text = usersList[indexPath.row].email
        cell.imageView?.contentMode = .scaleAspectFit
        
        let url = URL(string: usersList[indexPath.row].imageURL!)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async {
                cell.imageView?.image = UIImage(data: data!)
                self.tableView.reloadData()
//                print(data)
            }
        }.resume()
//        cell.imageView?.image = UIImage(named: "white-snow-leopard")
        return cell
    }
}
