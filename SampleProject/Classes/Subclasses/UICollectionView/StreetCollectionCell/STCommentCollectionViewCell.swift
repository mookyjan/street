//
//  STCommentCollectionViewCell.swift
//  STREET
//
//  Created by Waris Shams on 30/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STCommentCollectionViewCell: UICollectionViewCell

{
    @IBOutlet weak var btnComment_Pressed: UIButton!
    
    @IBOutlet weak var imageOfProduct: UIImageView!
    
    @IBOutlet weak var lblName: UIButton!
    @IBOutlet weak var lblDescription: UILabel!
    
    
    override func awakeFromNib() {
        UtilityFunctions .setViewBorder(btnComment_Pressed!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))
        self.layer.masksToBounds = true;
        self.layer.contentsScale = UIScreen.mainScreen().scale
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSizeZero

    }
    
    
    @IBAction func btnComment_Pressed(sender: AnyObject) {
    }
    
}
