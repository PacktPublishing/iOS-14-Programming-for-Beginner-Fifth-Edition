//
//  RatingsView.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 15/10/2020.
//

import UIKit

class RatingsView: UIControl {
    
    let imgFilledStar = #imageLiteral(resourceName: "filled-star")
    let imgHalfStar = #imageLiteral(resourceName: "half-star")
    let imgEmptyStar = #imageLiteral(resourceName: "empty-star")
    var rating = 0.0
    var totalStars = 5

    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect){
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.systemBackground.cgColor)
        context!.fill(rect)
        let availWidth = rect.size.width
        let cellWidth = availWidth / CGFloat(totalStars)
        let starSide = (cellWidth <= rect.size.height) ? cellWidth : rect.size.height
        for index in 0...totalStars {
            let value = cellWidth * CGFloat(index) + cellWidth/2
            let center = CGPoint(x: value+1, y: rect.size.height/2)
            let frame = CGRect(x: center.x - starSide/2, y: center.y - starSide/2, width: starSide, height: starSide)
            let highlighted = Double(index+1) <= self.rating.rounded(.up)
            if highlighted && (Double(index+1) > self.rating) {
                drawHalfStar(with: frame)
            } else {
                drawStar(with: frame, highlighted: highlighted)
            }
            
        
        }
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        guard self.isEnabled else {
            return false
        }
        super.beginTracking(touch, with: event)
        handle(with: touch)
        return true
    }
}

private extension RatingsView {
    
    func handle(with touch: UITouch){
        let cellWidth = self.bounds.size.width / CGFloat(totalStars)
        let location = touch.location(in: self)
        var value = location.x  / cellWidth
        if ((value + 0.5) < value.rounded(.up)){
            value = floor(value) + 0.5
        } else {
            value = value.rounded(.up)
        }
        updateRating(with: Double(value))
    }
    
    func updateRating(with value: Double) {
        if (self.rating != value && value >= 0 && value <= Double(totalStars)){
            self.rating = value
            setNeedsDisplay()
        }
    }
    
    func drawStar(with frame:CGRect, highlighted: Bool){
        let image = highlighted ? imgFilledStar : imgEmptyStar
        draw(with: image, and: frame)
    }
    
    func drawHalfStar(with frame: CGRect) {
        draw(with: imgHalfStar, and: frame)
    }
    
    func draw(with image: UIImage, and frame: CGRect) {
        image.draw(in: frame)
    }
    
}
