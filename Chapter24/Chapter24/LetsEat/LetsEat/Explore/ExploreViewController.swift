//
//  ExploreViewController.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 02/10/2020.
//

import UIKit

class ExploreViewController: UIViewController,  UICollectionViewDelegate {
    


    @IBOutlet weak var collectionView: UICollectionView!
    
    let manager = ExploreDataManager()
    
    var selectedCity: LocationItem?
    
    var headerView: ExploreHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segue.locationList.rawValue:
            showLocationList(segue: segue)
        case Segue.restaurantList.rawValue:
            showRestaurantListing(segue: segue)
        default:
            print("Segue not added")
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Segue.restaurantList.rawValue {
            guard selectedCity != nil else {
                showAlert()
                return false
            }
            return true
        }
        return true
    }
    

}

// MARK: Private Extension
private extension ExploreViewController {
    func initialize() {
        manager.fetch()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 7
        collectionView.collectionViewLayout = flow
    }
    
    func showLocationList(segue: UIStoryboardSegue){
        guard let navController = segue.destination as? UINavigationController, let viewController = navController.topViewController as? LocationViewController else {
            return
        }
        guard let city = selectedCity else { return }
        viewController.selectedCity = city
    }
    
    func showRestaurantListing(segue: UIStoryboardSegue) {
        if let viewController = segue.destination as? RestaurantListViewController, let city = selectedCity, let index = collectionView.indexPathsForSelectedItems?.first {
            viewController.selectedType = manager.explore(at: index).name
            viewController.selectedCity = city
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Location Needed", message: "Please select a location.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func unwindLocationCancel(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func unwindLocationDone(segue: UIStoryboardSegue) {
        if let viewController = segue.source as? LocationViewController {
            selectedCity = viewController.selectedCity
            if let location = selectedCity {
                headerView.lblLocation.text = location.full
            }
        }
    }
}
// MARK: UICollectionViewDataSource
extension ExploreViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        headerView = header as? ExploreHeaderView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        manager.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreCell
        let item = manager.explore(at: indexPath)
        cell.lblName.text = item.name
        cell.imgExplore.image = UIImage(named: item.image)
        return cell
    }
    
}

extension ExploreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var factor: CGFloat = 2
        if Device.isPad || (traitCollection.horizontalSizeClass != .compact){
            factor = 3
        }
        let viewWidth = collectionView.frame.size.width
        let contentWidth = viewWidth - 7 * (factor + 1)
        let cellWidth = contentWidth / factor
        let cellHeight = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}
