//
//  STSentInvitationCollectionCell.swift
//  STREET
//
//  Created by Waris Shams on 14/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STSentInvitationCollectionCell: UICollectionViewCell
{
    class func fromNib() -> STSentInvitationCollectionCell?
    {
        var cell: STSentInvitationCollectionCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STSentInvitationCollectionCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STSentInvitationCollectionCell {
                cell = cellView
            }
        }
        return cell
    }

    
    
    override func awakeFromNib() {
        self.layer.masksToBounds = false;
        self.layer.contentsScale = UIScreen.mainScreen().scale
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSizeZero
        
    }
 }
