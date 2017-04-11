//
//  STMyOwnStoryCollectionViewCell.swift
//  STREET
//
//  Created by Waris Shams on 03/11/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STMyOwnStoryCollectionViewCell: UICollectionViewCell {
    
    class func fromNib() -> STMyOwnStoryCollectionViewCell?
    {
        var cell: STMyOwnStoryCollectionViewCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STMyOwnStoryCollectionViewCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STMyOwnStoryCollectionViewCell {
                cell = cellView
            }
        }
        return cell
    }

}
