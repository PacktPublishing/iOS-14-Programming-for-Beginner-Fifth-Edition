//
//  FilterItem.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 30/10/2020.
//

import Foundation

class FilterItem: NSObject {
    let filter: String
    let name: String
    
    init(dict:[String:AnyObject]) {
        name = dict["name"] as! String
        filter = dict["filter"] as! String
    }
}
