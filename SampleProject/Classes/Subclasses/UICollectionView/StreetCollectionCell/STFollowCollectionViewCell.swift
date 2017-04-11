//
//  STFollowCollectionViewCell.swift
//  STREET
//
//  Created by Waris Shams on 27/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STFollowCollectionViewCell: UICollectionViewCell {
 
    class func fromNib() -> STFollowCollectionViewCell?
    {
        var cell: STFollowCollectionViewCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STFollowCollectionViewCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STFollowCollectionViewCell {
                cell = cellView
            }
        }
        return cell
    }

}
