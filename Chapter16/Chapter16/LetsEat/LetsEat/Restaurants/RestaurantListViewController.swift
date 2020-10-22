//
//  RestaurantListViewController.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 04/10/2020.
//

import UIKit

class RestaurantListViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
}

// MARK: Private Extension
private extension RestaurantListViewController {
    // code goes here
}
// MARK: UICollectionViewDataSource
extension RestaurantListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath)
    }
}
