//
//  STLetsMeetDetailViewController.swift
//  STREET
//
//  Created by Waris Shams on 26/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STLetsMeetDetailViewController: BaseViewController {

    // MARK:
    // MARK : UIViewController Lifecycle
    // MARK : -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Initializations
        initializations()
        //SetupView
        setUpView()
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        
    }
    
    func setUpView()
    {
        self.view.layoutIfNeeded()
        self.setupNavigationBarTitle("Lets Meet", showRightButton: false, leftButtonType:.Back, rightButtonType:.None)
        
//        UtilityFunctions .setViewBorder(btnSendInvite!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))
        
    }
    
    func initializations()
    {
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func leftNavigationButtonClicked(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
