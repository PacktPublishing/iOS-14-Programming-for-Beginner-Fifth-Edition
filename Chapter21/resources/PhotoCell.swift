//
//  PhotoCell.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 17/10/2020.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet var imgReview: UIImageView!
}

extension PhotoCell {
    func set(image:UIImage) {
        imgReview.image = image
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        imgReview.layer.cornerRadius = 9
        imgReview.layer.masksToBounds = true
    }
}
