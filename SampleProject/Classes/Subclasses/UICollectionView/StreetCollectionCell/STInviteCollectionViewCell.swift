//
//  STInviteCollectionViewCell.swift
//  STREET
//
//  Created by Waris Shams on 30/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STInviteCollectionViewCell: UICollectionViewCell

{
    class func fromNib() -> STInviteCollectionViewCell?
    {
        var cell: STInviteCollectionViewCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STInviteCollectionViewCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STInviteCollectionViewCell {
                cell = cellView
            }
        }
        return cell
    }

}
