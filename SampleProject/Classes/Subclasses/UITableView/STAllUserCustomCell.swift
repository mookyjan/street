//
//  STAllUserCustomCell.swift
//  STREET
//
//  Created by Waris Shams on 05/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit


protocol FollowUnFollowDelegate{
    
    func followUnFollow(cell : STAllUserCustomCell)
    
    
}

class STAllUserCustomCell: UITableViewCell {

    var delegate: FollowUnFollowDelegate?

    @IBOutlet weak var btnFollowUnFollow: UIButton!
    @IBOutlet weak var imageOfUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func btnFollowUnFollow_Pressed(sender: UIButton)
    {
        sender.selected = !sender.selected
        self.delegate?.followUnFollow(self)
    
    }
    
    
    
//    @IBAction func btnFollowUnFollow_Pressed(sender: AnyObject)
//     {
//        sender.selected = !sender.selected
//
//
//        //        if (sender.selected != nil)
////        {
////            sender.setSelected(false, animated: true)
////        }
////        else
////        {
////            sender.setSelected(true, animated: true)
////            
////        }
//
//      
//    }
//
    
}
