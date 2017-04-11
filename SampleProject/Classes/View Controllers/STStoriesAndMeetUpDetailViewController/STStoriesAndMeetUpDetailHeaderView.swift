//
//  STStoriesAndMeetUpDetailHeaderView.swift
//  STREET
//
//  Created by Shuja on 11/11/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit
protocol STStorieDetailNavigationButtonsDelegate {
    
    func backButtonPressed()
    func shareButtonPressed()
}
class STStoriesAndMeetUpDetailHeaderView: UITableViewHeaderFooterView {

    var delegate:STStorieDetailNavigationButtonsDelegate?
    
    @IBOutlet weak var btn_Back: UIButton!
    @IBOutlet weak var btn_Share: UIButton!
    
    @IBAction func shareButtonPressed(sender: AnyObject) {
        self.delegate?.shareButtonPressed()
    }
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.delegate?.backButtonPressed()
    }

}
