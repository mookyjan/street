//
//  STPopMapTableViewCell.swift
//  STREET
//
//  Created by Waris Shams on 31/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STPopMapTableViewCell: UITableViewCell {

    @IBOutlet weak var btnFollowUnFollowPressed: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    UtilityFunctions .setViewBorder(btnFollowUnFollowPressed!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))
    
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnFollowUnFollow_Pressed(sender: UIButton)
    {
       sender.selected =  !sender.selected
        
    }
}
