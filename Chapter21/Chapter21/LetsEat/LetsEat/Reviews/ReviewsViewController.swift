//
//  ReviewsViewController.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 17/10/2020.
//

import UIKit

class ReviewsViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    var selectedRestaurantID: Int?
    var reviews: [ReviewItem] = []
    var dateFormatter:
        DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd, yyyy"
            return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkReviews()
    }
}

private extension ReviewsViewController {
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
    
    func checkReviews() {
        let viewController = self.parent as? RestaurantDetailViewController
        if let id = viewController?.selectedRestaurant?.restaurantID {
            reviews = CoreDataManager.shared.fetchReviews(by: id)
            if reviews.count > 0 {
                collectionView.backgroundView = nil
            } else {
                let view = NoDataView(frame: CGRect(x: 0, y: 0, width: collectionView.frame.width, height: collectionView.frame.height))
                view.set(title: "Reviews")
                view.set(desc: "There are currently no reviews")
                collectionView.backgroundView = view
            }
        }
        collectionView.reloadData()
    }
}

extension ReviewsViewController:
    
    UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell", for: indexPath) as! ReviewCell
        let item = reviews[indexPath.item]
        cell.lblName.text = item.name
        cell.lblTitle.text = item.title
        cell.lblReview.text = item.customerReview
        if let date = item.date {
            cell.lblDate.text = dateFormatter.string(from: date)
        }
        if let rating = item.rating {
            cell.ratingsView.rating = Double(rating)
        }
        return cell
    }
}

extension ReviewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if reviews.count == 1 {
            let width = collectionView.frame.size.width - 14
            return CGSize(width: width, height: 200)
        } else {
            let width = collectionView.frame.size.width - 21
            return CGSize(width: width, height: 200 )
        }
    }
}
