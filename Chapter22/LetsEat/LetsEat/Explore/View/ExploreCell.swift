//
//  ExploreCell.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 27/10/2020.
//

import UIKit

class ExploreCell: UICollectionViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var imgExplore: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgExplore.layer.cornerRadius = 9
        imgExplore.layer.masksToBounds = true
    }
    
}
