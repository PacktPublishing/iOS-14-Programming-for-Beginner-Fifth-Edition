//
//  LocationItem.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 14/10/2020.
//

import Foundation

struct LocationItem {
    var city: String?
    var state: String?
}
extension LocationItem {
    init(dict: [String:AnyObject]){
        self.city = dict["city"] as? String
        self.state = dict["state"] as? String
    }
    var full: String {
        guard let city = self.city, let state = self.state
        else { return "" }
        return "\(city), \(state)"
    }
}
