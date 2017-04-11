//
//  STPhoneContactTableViewCell.swift
//  STREET
//
//  Created by Waris Shams on 28/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STPhoneContactTableViewCell: UITableViewCell {

    @IBOutlet weak var btnContactSelected: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func contactSelectedPressed(sender: AnyObject) {
        if btnContactSelected.selected {
            btnContactSelected.selected = false
            btnContactSelected.borderColor = UIColor.lightGrayColor()
        }
        else {
            btnContactSelected.selected = true;
            btnContactSelected.borderColor = UIColor.clearColor()
        }
    }

}
