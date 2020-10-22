//
//  RestaurantItem.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 10/10/2020.
//

import UIKit
import MapKit

class RestaurantItem: NSObject, MKAnnotation, Decodable {
    
    var name: String?
    var cuisines:[String] = []
    var lat: Double?
    var long: Double?
    var address: String?
    var postalCode: String?
    var state: String?
    var imageURL: String?
    var restaurantID: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case cuisines
        case lat
        case long
        case address
        case postalCode = "postal_code"
        case state
        case imageURL = "image_url"
        case restaurantID = "id"
    }
    
    var coordinate: CLLocationCoordinate2D {
        guard let lat = lat, let long = long else {
            return CLLocationCoordinate2D()
        }
        return CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    var title: String? {
        return name
    }
    
    var subtitle: String? {
        if cuisines.isEmpty {return ""}
        else if cuisines.count == 1 {return cuisines.first}
        else {return cuisines.joined(separator:", ")}
    }
    


}
