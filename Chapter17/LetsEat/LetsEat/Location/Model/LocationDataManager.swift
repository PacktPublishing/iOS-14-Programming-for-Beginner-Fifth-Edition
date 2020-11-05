//
//  LocationDataManager.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 28/10/2020.
//

import Foundation

class LocationDataManager {
    
    private var locations: [LocationItem] = []
    
    private func loadData() -> [[String:AnyObject]] {
        guard let path = Bundle.main.path(forResource: "Locations", ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        return items as! [[String:AnyObject]]
    }
    
    func fetch() {
        for location in loadData() {
                locations.append(LocationItem(dict: location))
            }
        }
    
    func numberOfItems() -> Int {
        locations.count
    }
    
    func locationItem(at index: IndexPath) -> LocationItem {
        locations[index.item]
    }
    
    func findLocation (by name: String) -> (isFound: Bool, position: Int) {
        guard let index = locations.firstIndex(where: { $0.city == name }) else {
            return (isFound: false, position: 0)
        }
        return (isFound: true, position: index)
    }
}
