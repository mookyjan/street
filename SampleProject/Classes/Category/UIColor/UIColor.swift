//
//  UIColor.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 01/03/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /**
     * Initializes and returns a color object for the given RGB hex integer.
     */
    public convenience init(rgb: Int) {
        self.init(
            red:   CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((rgb & 0x0000FF) >> 0)  / 255.0,
            alpha: 1)
    }
    
    public convenience init(colorString: String) {
        var colorInt: UInt32 = 0
        NSScanner(string: colorString).scanHexInt(&colorInt)
        self.init(rgb: (Int) (colorInt ?? 0xaaaaaa))
    }
}