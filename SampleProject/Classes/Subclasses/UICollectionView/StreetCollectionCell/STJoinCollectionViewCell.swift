//
//  STJoinCollectionViewCell.swift
//  STREET
//
//  Created by Waris Shams on 30/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STJoinCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileJoinView: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblTiming: UILabel!
    @IBOutlet weak var btnJoining_Pressed: UIButton!
    
    
    class func fromNib() -> STJoinCollectionViewCell?
    {
        var cell: STJoinCollectionViewCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STJoinCollectionViewCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STJoinCollectionViewCell {
                cell = cellView
            }
        }
        return cell
    }

    
    override func awakeFromNib() {
//        UtilityFunctions .setViewBorder(btnJoining_Pressed!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))
        
//        UtilityFunctions.setTheViewOpacity(profileJoinView)

                self.layer.masksToBounds = true;
                self.layer.contentsScale = UIScreen.mainScreen().scale
                self.layer.shadowOpacity = 0.4
                self.layer.shadowRadius = 2.0
                self.layer.shadowOffset = CGSizeZero

    }
    
    
       
}
