//
//  ChatLabel.h
//  DynamicHeightCell
//
//  Created by Tahir Iqbal on 11/02/2016.
//  Copyright © 2016 Devbatch. All rights reserved.
//
import UIKit
class SPLabel: UILabel {
    var textInsets: UIEdgeInsets

    func textRectForBounds(bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var insets: UIEdgeInsets = self.textInsets
        var rect: CGRect = super.textRectForBounds(UIEdgeInsetsInsetRect(bounds, insets), limitedToNumberOfLines: numberOfLines)
        rect.origin.x -= insets.left
        rect.origin.y -= insets.top
        rect.size.width += (insets.left + insets.right)
        rect.size.height += (insets.top + insets.bottom)
        return rect
    }

    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, self.textInsets))
    }
}
//
//  ChatLabel.m
//  DynamicHeightCell
//
//  Created by Tahir Iqbal on 11/02/2016.
//  Copyright © 2016 Devbatch. All rights reserved.
//