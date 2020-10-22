//
//  ExploreItem.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 08/10/2020.
//

import Foundation

struct ExploreItem {
    var name: String
    var image: String
}

extension ExploreItem {
    init(dict:[String:AnyObject]){
        self.name = dict["name"] as! String
        self.image = dict["image"] as! String
    }
}
