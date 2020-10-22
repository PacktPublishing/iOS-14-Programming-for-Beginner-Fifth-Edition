//
//  ViewController.swift
//  LetsEatAppClip
//
//  Created by iOS 14 Programming on 22/10/2020.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    var selectedCity: String?
    var selectedRestaurantID: Int? {
        didSet{
            performSegue(withIdentifier: "showRestaurantDetail", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? RestaurantDetailViewController {
            var restaurants: [RestaurantItem] = []
            let manager = RestaurantDataManager()
            if let city = selectedCity, let id = selectedRestaurantID {
                manager.fetch(by: city, completionHandler: {
                                (items) in restaurants = items })
                for restaurant in restaurants {
                    if id == restaurant.restaurantID {
                        viewController.selectedRestaurant = restaurant
                    }
                }
            }
        }
    }
    

}


extension RestaurantDetailViewController{
   
    override func viewDidAppear(_ animated: Bool) {
        displayOverlay()
    }
    
    func displayOverlay() {
        guard let scene = view.window?.windowScene else { return }
        let config = SKOverlay.AppConfiguration(appIdentifier: "iTunes identifier", position: .bottom)
        let overlay = SKOverlay(configuration: config)
        overlay.present(in: scene)
    }
    
}

