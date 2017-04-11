//
//  STAddPhotoCollectionCell.swift
//  STREET
//
//  Created by Waris Shams on 30/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STAddPhotoCollectionCell: UICollectionViewCell
{
  
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var btnPizza: UIButton!
    
    @IBOutlet weak var btnJalapeno: UIButton!
    
    @IBOutlet weak var btnGreekSalad: UIButton!
   
    
    override func awakeFromNib() {
        UtilityFunctions .setViewBorder(btnPizza!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))
        UtilityFunctions .setViewBorder(btnJalapeno!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))
        UtilityFunctions .setViewBorder(btnGreekSalad!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))

    }
    
    @IBAction func btnPickPhoto(sender: AnyObject)
    {
    
    
    }
    
}
