//
//  STSharedStoryCollectionViewCell.swift
//  STREET
//
//  Created by Waris Shams on 27/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STSharedStoryCollectionViewCell: UICollectionViewCell

{
    class func fromNib() -> STSharedStoryCollectionViewCell?
    {
        var cell: STSharedStoryCollectionViewCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STSharedStoryCollectionViewCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STSharedStoryCollectionViewCell {
                cell = cellView
            }
        }
        return cell
    }
    
}
