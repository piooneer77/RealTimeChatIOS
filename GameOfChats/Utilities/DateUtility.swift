//
//  DateUtility.swift
//  GameOfChats
//
//  Created by Apple on 3/18/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import Foundation

class DateUtility {
    
    class func getCurrentTimeStampString() -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return dateFormatter.string(from: today)
    }
    
}
