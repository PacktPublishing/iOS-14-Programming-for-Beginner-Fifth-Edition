//
//  RestaurantItem.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 15/07/2020.
//

import Foundation
import MapKit

struct RestaurantItem: Identifiable {
    var id = UUID()
    var name: String
    var address: String
    var city:String
    var cuisines:[String] = []
    var lat:CLLocationDegrees
    var long:CLLocationDegrees
    var imageURL: String
    var title: String {
        return name
    }
    var subtitle: String {
        if cuisines.isEmpty { return "" }
        else if cuisines.count == 1 { return cuisines.first! }
        else { return cuisines.joined(separator: ", ")}
    }
}

let testData = [
    RestaurantItem(name: "The Tap Trailhouse", address: "17 Union St", city: "Boston", cuisines: ["Brewery","Burgers","American"], lat: 42.360847, long: -71.056819, imageURL: "https://resizer.otstatic.com/v2/profiles/legacy/145237.jpg"),
    RestaurantItem(name: "o ya", address: "9 East Street", city: "Boston", cuisines: ["Japanese", "Sushi","Int'l"], lat: 42.351353, long: -71.056941, imageURL: "https://resizer.otstatic.com/v2/profiles/legacy/28066.jpg"),
    RestaurantItem(name: "Skipjack's Boston", address: "199 Clarendon St.", city: "Boston", cuisines: ["American", "Burgers","Brewery"], lat: 42.349887, long: -71.07484, imageURL: "https://resizer.otstatic.com/v2/profiles/legacy/11656.jpg"),
    RestaurantItem(name: "The Elephant Walk", address: "900 Beacon Street", city: "Boston", cuisines: ["Panasian", "Vietnamese","Int'l"], lat: 42.346541, long: -71.105827, imageURL: "https://resizer.otstatic.com/v2/profiles/legacy/1635.jpg"),
    RestaurantItem(name: "Metropolis Cafe", address: "584 Tremont Street", city: "Boston", cuisines: ["Mediterranean", "Int'l","Tapas"], lat: 42.3432, long: -71.0727, imageURL: "https://resizer.otstatic.com/v2/profiles/legacy/2829.jpg")

]
