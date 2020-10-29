//
//  RestaurantDetailViewController.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 28/10/2020.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {
    
    var selectedRestaurant: RestaurantItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        dump(selectedRestaurant as Any)
    }


}
