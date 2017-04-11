//
//  STInvitePeopleForStoryCollectionCell.swift
//  STREET
//
//  Created by Waris Shams on 03/11/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STInvitePeopleForStoryCollectionCell: UICollectionViewCell {
    class func fromNib() -> STInvitePeopleForStoryCollectionCell?
    {
        var cell: STInvitePeopleForStoryCollectionCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STInvitePeopleForStoryCollectionCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STInvitePeopleForStoryCollectionCell {
                cell = cellView
            }
        }
        return cell
    }

}
