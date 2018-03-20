//
//  ViewController.swift
//  GameOfChats
//
//  Created by Apple on 3/13/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit
import Firebase

class MessegeController: UITableViewController {
    
    var navigationBarUserName : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded MessegeController")
        view.backgroundColor = .white
        setUpNavigationBarItems()
        isUserLoggedIn()
    }
}

