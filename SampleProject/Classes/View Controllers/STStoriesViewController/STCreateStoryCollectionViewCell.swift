//
//  STCreateStoryCollectionViewCell.swift
//  STREET
//
//  Created by Shuja on 08/11/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

protocol removeImageButtonDelegate {
    func deleteButtonPressed(cell: STCreateStoryCollectionViewCell)
}


class STCreateStoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgV_ShareImage: UIImageView!
    @IBOutlet weak var btnCross: UIButton!
    
    var delegate:removeImageButtonDelegate?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func btnCrossPressed(sender: AnyObject) {
        
        self.delegate?.deleteButtonPressed(self)
    }
}
