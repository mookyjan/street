//
//  STPartOfInvitationStoryCollectionCell.swift
//  STREET
//
//  Created by Waris Shams on 03/11/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STPartOfInvitationStoryCollectionCell: UICollectionViewCell {
    
    
    class func fromNib() -> STPartOfInvitationStoryCollectionCell?
    {
        var cell: STPartOfInvitationStoryCollectionCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STPartOfInvitationStoryCollectionCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STPartOfInvitationStoryCollectionCell {
                cell = cellView
            }
        }
        return cell
    }

}
