//
//  User.swift
//  GameOfChats
//
//  Created by Apple on 3/17/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import Foundation

class User : NSObject {
    
//    var id : Int?
    var name : String?
    var email : String?
    var magic : String?
    var imageURL : String?
    
    override init() {
        
    }
    
    init(json : [String:AnyObject]) {
        self.email = json["email"] as? String
        self.name = json["name"] as? String
        self.magic = json["magic"] as? String
        self.imageURL = json["imageURL"] as? String
    }
    
    deinit {
        
    }
}

