//
//  RestaurantDetailViewController.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 10/10/2020.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {
    
    var selectedRestaurant: RestaurantItem?

    override func viewDidLoad() {
        dump(selectedRestaurant as Any)
        super.viewDidLoad()
    }
}
