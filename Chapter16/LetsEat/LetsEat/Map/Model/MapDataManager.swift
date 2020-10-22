//
//  MapDataManager.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 10/10/2020.
//

import Foundation
import MapKit

class MapDataManager: DataManager {
    fileprivate var items:[RestaurantItem] = []
    var annotations:[RestaurantItem] {
        return items
    }
    func fetch(completion:(_ annotations:[RestaurantItem]) -> ()){
        if items.count > 0 { items.removeAll() }
        for data in load(file: "MapLocations") {
            items.append(RestaurantItem(dict: data))
        }
        completion(items)
    }
    
    func currentRegion(latDelta:CLLocationDegrees, longDelta:CLLocationDegrees) -> MKCoordinateRegion {
        guard let item = items.first else {
            return MKCoordinateRegion()
        }
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        return MKCoordinateRegion(center: item.coordinate, span: span)
    }

}
