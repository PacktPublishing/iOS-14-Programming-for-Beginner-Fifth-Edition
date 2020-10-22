//
//  RestaurantListViewController.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 04/10/2020.
//

import UIKit

class RestaurantListViewController: UIViewController, UICollectionViewDelegate {
    
    var manager = RestaurantDataManager()
    
    var selectedRestaurant: RestaurantItem?
    var selectedCity: LocationItem?
    var selectedType: String?
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case Segue.showDetail.rawValue:
                showRestaurantDetail(segue:segue)
            default:
                print("Segue not added")
                
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createData()
        setupTitle()
    }
    
   
}

// MARK: Private Extension
private extension RestaurantListViewController {
    
    func showRestaurantDetail(segue:UIStoryboardSegue){
        if let viewController = segue.destination as? RestaurantDetailViewController, let index = collectionView.indexPathsForSelectedItems?.first {
            selectedRestaurant = manager.restaurantItem(at: index)
            viewController.selectedRestaurant = selectedRestaurant
        }
    }
    
    func setupTitle() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        if let city = selectedCity?.city, let state = selectedCity?.state {
            title = "\(city.uppercased()), \(state.uppercased())"
        }
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func createData() {
        guard let location = selectedCity?.city, let filter = selectedType else { return }
        manager.fetch(by: location, with: filter) {
            _ in if
                manager.numberOfItems() > 0 {
                collectionView.backgroundView = nil
            } else {
                let view = NoDataView(frame: CGRect(x: 0, y: 0, width: collectionView.frame.width, height: collectionView.frame.height))
                view.set(title: "Restaurants")
                view.set(desc: "No restaurants found.")
                collectionView.backgroundView = view
            }
        collectionView.reloadData()
        }
    }
}
// MARK: UICollectionViewDataSource
extension RestaurantListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        manager.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath) as! RestaurantCell
        let item = manager.restaurantItem(at: indexPath)
        if let name = item.title {
            cell.lblTitle.text = name
        }
        if let cuisine = item.subtitle {
            cell.lblCuisine.text = cuisine
        }
        if let image = item.imageURL {
            if let url = URL(string: image ) {
                let data = try? Data(contentsOf: url)
                if let imageData = data {
                    DispatchQueue.main.async {
                        cell.ingRestaurant.image = UIImage(data: imageData)
                    }
                }
            }
        }
        return cell
    }
    
}
