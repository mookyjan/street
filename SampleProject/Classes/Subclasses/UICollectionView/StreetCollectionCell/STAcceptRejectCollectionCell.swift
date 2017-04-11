//
//  STAcceptRejectCollectionCell.swift
//  STREET
//
//  Created by Waris Shams on 30/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STAcceptRejectCollectionCell: UICollectionViewCell {
    class func fromNib() -> STAcceptRejectCollectionCell?
    {
        var cell: STAcceptRejectCollectionCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STAcceptRejectCollectionCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STAcceptRejectCollectionCell {
                cell = cellView
            }
        }
        return cell
    }

    
    
}
