//
//  STReceivedInvitationCollectionCell.swift
//  STREET
//
//  Created by Waris Shams on 14/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STReceivedInvitationCollectionCell: UICollectionViewCell

{
    
    class func fromNib() -> STReceivedInvitationCollectionCell?
    {
        var cell: STReceivedInvitationCollectionCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STReceivedInvitationCollectionCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STReceivedInvitationCollectionCell {
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
