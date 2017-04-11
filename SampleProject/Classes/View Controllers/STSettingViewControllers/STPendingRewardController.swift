//
//  STPendingRewardController.swift
//  SampleProject
//
//  Created by Ahmad on 24/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STPendingRewardController: BaseViewController {

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
        self.setupNavigationBarTitle("Pending Rewards", showRightButton:false, leftButtonType:.Back, rightButtonType:.None )
    }
    
    func initializations()
    {
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
  
}
