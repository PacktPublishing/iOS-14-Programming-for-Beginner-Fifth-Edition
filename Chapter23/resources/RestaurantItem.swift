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
    var imageName: String
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
    RestaurantItem(name: "The Tap Trailhouse", address: "17 Union St", city: "Boston", cuisines: ["Brewery","Burgers","American"], lat: 42.360847, long: -71.056819, imageName: "145237"),
    RestaurantItem(name: "o ya", address: "9 East Street", city: "Boston", cuisines: ["Japanese", "Sushi","Int'l"], lat: 42.351353, long: -71.056941, imageName: "28066"),
    RestaurantItem(name: "Skipjack's Boston", address: "199 Clarendon St.", city: "Boston", cuisines: ["American", "Burgers","Brewery"], lat: 42.349887, long: -71.07484, imageName: "11656"),
    RestaurantItem(name: "The Elephant Walk", address: "900 Beacon Street", city: "Boston", cuisines: ["Panasian", "Vietnamese","Int'l"], lat: 42.346541, long: -71.105827, imageName: "1635"),
    RestaurantItem(name: "Metropolis Cafe", address: "584 Tremont Street", city: "Boston", cuisines: ["Mediterranean", "Int'l","Tapas"], lat: 42.3432, long: -71.0727, imageName: "2829")

]
