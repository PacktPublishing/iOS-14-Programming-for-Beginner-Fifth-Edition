//
//  PhotoCell.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 27/07/2020.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var imgReview: UIImageView!
}

extension PhotoCell {
    func set(image:UIImage) {
        imgReview.image = image
        roundedCorners()
    }
    
    func roundedCorners() {
        imgReview.layer.cornerRadius = 9
        imgReview.layer.masksToBounds = true
    }
}
