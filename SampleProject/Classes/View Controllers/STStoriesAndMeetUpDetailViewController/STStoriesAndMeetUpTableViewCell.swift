//
//  STStoriesAndMeetUpTableViewCell.swift
//  STREET
//
//  Created by Shuja on 11/11/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STStoriesAndMeetUpTableViewCell: UITableViewCell {

    @IBOutlet weak var btnUserProfile: UIButton!
    @IBOutlet weak var btnTickOrCross: UIImageView!
    @IBOutlet weak var lbl_UserName: UILabel!
    @IBOutlet weak var lbl_UserComment: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnUserProfilePressed(sender: AnyObject) {
        
    }
}
