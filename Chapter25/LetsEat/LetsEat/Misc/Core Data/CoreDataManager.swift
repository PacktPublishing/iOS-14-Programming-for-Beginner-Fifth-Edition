//
//  CoreDataManager.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 30/10/2020.
//

import Foundation
import CoreData

struct CoreDataManager {
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "LetsEatModel")
        container.loadPersistentStores {
            (storeDesc, error) in
            error.map {
                print ($0)
            }
        }
    }
    
    func fetchRestaurantRating(by identifier: Int) -> Double {
        let reviews = fetchReviews(by: identifier)
        let sum = reviews.reduce(0, {$0 + ($1.rating ?? 0)})
        return sum / Double(reviews.count)
    }
    
    func addReview(_ item: ReviewItem) {
        let review = Review(context: container.viewContext)
        review.name = item.name
        review.title = item.title
        review.date = Date()
        if let rating = item.rating {
            review.rating = rating
        }
        review.customerReview = item.customerReview
        review.uuid = item.uuid
        if let id = item.restaurantID {
            review.restaurantID = Int32(id)
            save()
        }
    }
    
    
    
    func addPhoto(_ item: RestaurantPhotoItem) {
        let photo = RestaurantPhoto(context: container.viewContext)
        photo.date = Date()
        photo.photo = item.photoData
        photo.uuid = item.uuid
        if let id = item.restaurantID {
            photo.restaurantID = Int32(id)
            save()
        }
    }
    
    func fetchReviews(by identifier: Int) -> [ReviewItem] {
        let moc = container.viewContext
        let request: NSFetchRequest<Review> = Review.fetchRequest()
        let predicate = NSPredicate(format: "restaurantID = %i", Int32(identifier))
        var items: [ReviewItem] = []
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        request.predicate = predicate
        do {
            for review in try moc.fetch(request) {
                items.append(ReviewItem(review: review))
            }
            return items
        } catch  {
            fatalError("Failed to fetch reviews: \(error)")
        }
    }
    
    func fetchPhotos(by identifier: Int) -> [RestaurantPhotoItem] {
        let moc = container.viewContext
        let request: NSFetchRequest<RestaurantPhoto> = RestaurantPhoto.fetchRequest()
        let predicate = NSPredicate(format: "restaurantID = %i", Int32(identifier))
        var items: [RestaurantPhotoItem] = []
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        request.predicate = predicate
        do {
            for restaurantPhoto in try moc.fetch(request) {
                items.append(RestaurantPhotoItem(restaurantPhoto: restaurantPhoto))
            }
            return items
        } catch  {
            fatalError("Failed to fetch photos: \(error)")
        }
    }
    
    private func save() {
        do {
            if container.viewContext.hasChanges {
                try container.viewContext.save()
            }
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
}
