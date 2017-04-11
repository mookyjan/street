//
//  STAdminNotificationCollectionCell.swift
//  STREET
//
//  Created by Waris Shams on 30/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STAdminNotificationCollectionCell: UICollectionViewCell
{

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    class func fromNib() -> STAdminNotificationCollectionCell?
    {
        var cell: STAdminNotificationCollectionCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("STAdminNotificationCollectionCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? STAdminNotificationCollectionCell {
                cell = cellView
            }
        }
        return cell
    }
    override func awakeFromNib() {
//        self.layer.masksToBounds = true;
//        self.layer.contentsScale = UIScreen.mainScreen().scale
//        self.layer.shadowOpacity = 0.4
//        self.layer.shadowRadius = 2.0
//        self.layer.shadowOffset = CGSizeZero

    }
    

    
    override func prepareForReuse()
    {

    }
    

    
    
}
