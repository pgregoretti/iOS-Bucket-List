//
//  StrikeThroughText.swift
//  bucketList
//
//  Created by Pamela on 9/26/16.
//  Copyright © 2016 Pam. All rights reserved.
//

import UIKit
import QuartzCore

// A UILabel subclass that can optionally have a strikethrough.
class StrikeThroughText: UILabel {
    let strikeThroughLayer: CALayer
    // A Boolean value that determines whether the label should have a strikethrough.
    var strikeThrough : Bool {
        didSet {
            strikeThroughLayer.isHidden = !strikeThrough
            if strikeThrough {
                resizeStrikeThrough()
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init(frame: CGRect) {
        strikeThroughLayer = CALayer()
        strikeThroughLayer.backgroundColor = UIColor.black.cgColor
        strikeThroughLayer.isHidden = true
        strikeThrough = false
        
        super.init(frame: frame)
        layer.addSublayer(strikeThroughLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resizeStrikeThrough()
    }
    
    let kStrikeOutThickness: CGFloat = 2.0
    func resizeStrikeThrough() {
        let textSize = text!.size(attributes: [NSFontAttributeName:font])
        strikeThroughLayer.frame = CGRect(x: 0, y: bounds.size.height/2,
                                          width: textSize.width, height: kStrikeOutThickness)
    }
}
