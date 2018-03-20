//
//  NewMessageControllerExtension.swift
//  GameOfChats
//
//  Created by Apple on 3/15/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit
import Firebase

extension NewMessageViewController{
    
    func setUpNavigationBarItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelNewMessage))
    }
    
    func getAllMembers(){
        Firebase.Database.database().reference().child(FirebaseConstants.userTableName).observe(.childAdded) { (snapShot) in
            if let dictionary = snapShot.value as? [String:AnyObject] {
                let user = User(json: dictionary)
                self.usersList.append(user)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print("Did Get All Chat Members")
            }
        }
    }
    
    @objc private func cancelNewMessage(){
        dismiss(animated: true, completion: nil)
        print("Cancelled New Message")
    }
    
}
