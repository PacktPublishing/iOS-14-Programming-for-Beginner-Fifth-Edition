//
//  PhotosViewController.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 17/10/2020.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var selectedRestaurantID:Int?
    var restaurantPhotos: [RestaurantPhotoItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkPhotos()
    }
}

private extension PhotosViewController {
    func initialize() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 7
        flow.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flow
    }
    
    func checkPhotos() {
        let viewController = self.parent as? RestaurantDetailViewController
        if let id = viewController?.selectedRestaurant?.restaurantID {
            restaurantPhotos = CoreDataManager.shared.fetchPhotos(by: id)
            if restaurantPhotos.count > 0 {
                collectionView.backgroundView = nil
            } else {
                let view = NoDataView(frame: CGRect(x: 0, y: 0, width: collectionView.frame.width, height: collectionView.frame.height))
                view.set(title: "Photos")
                view.set(desc: "There are currently no photos")
                collectionView.backgroundView = view
            }
            collectionView.reloadData()
        }
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        restaurantPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        let item = restaurantPhotos[indexPath.item]
        
        if let photo = item.photo { cell.set(image: photo )}
        
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize {
        if restaurantPhotos.count == 1 {
            let width = collectionView.frame.size.width - 14
            return CGSize(width: width, height: 200)
        } else {
            let width = collectionView.frame.size.width - 21
            return CGSize(width: width, height: 200)
        }
    }
}
