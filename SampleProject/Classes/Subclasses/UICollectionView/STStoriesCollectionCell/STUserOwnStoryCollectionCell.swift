//
//  STUserOwnStoryCollectionCell.swift
//  STREET
//
//  Created by Waris Shams on 03/11/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STUserOwnStoryCollectionCell: UICollectionViewCell {
   
    class func fromNib() -> STUserOwnStoryCollectionCell?
    {
        var cell: STUserOwnStoryCollectionCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STUserOwnStoryCollectionCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STUserOwnStoryCollectionCell {
                cell = cellView
            }
        }
        return cell
    }

}
