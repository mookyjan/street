//
//  STSharedStoryWithPicCollectionViewCell.swift
//  STREET
//
//  Created by Waris Shams on 31/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STSharedStoryWithPicCollectionViewCell: UICollectionViewCell
{
    class func fromNib() -> STSharedStoryWithPicCollectionViewCell?
    {
        var cell: STSharedStoryWithPicCollectionViewCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STSharedStoryWithPicCollectionViewCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STSharedStoryWithPicCollectionViewCell {
                cell = cellView
            }
        }
        return cell
    }

}
