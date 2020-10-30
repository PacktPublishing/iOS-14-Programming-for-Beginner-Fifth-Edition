//
//  FilterCell.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 30/10/2020.
//

import UIKit

class FilterCell: UICollectionViewCell {
    @IBOutlet var lblName: UILabel!
    @IBOutlet var imgThumb: UIImageView!
}
extension FilterCell: ImageFiltering {
    func set(image: UIImage, item: FilterItem) {
        if item.filter != "None" {
            let filteredImg = apply(filter: item.filter, originalImage: image)
            imgThumb.image = filteredImg
        } else {
            imgThumb.image = image
        }
        lblName.text = item.name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        imgThumb.layer.cornerRadius = 9
        imgThumb.layer.masksToBounds = true
    }
}
