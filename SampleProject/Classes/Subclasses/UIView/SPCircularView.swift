//
//  SPCircularView.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 01/03/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class SPCircularView: UIView {
    
    @IBInspectable
    var color: UIColor = UIColor.redColor()
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        let innerFrame = CGRectMake(2, 2, rect.width - 4, rect.height - 4)
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextAddEllipseInRect(context, innerFrame)
        CGContextFillPath(context)
    }
}