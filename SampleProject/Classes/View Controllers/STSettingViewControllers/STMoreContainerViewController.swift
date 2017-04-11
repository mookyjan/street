//
//  STMoreContainerViewController.swift
//  STREET
//
//  Created by Waris Shams on 30/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STMoreContainerViewController: BaseViewController {

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
        self.setupNavigationBarTitle("Setting", showRightButton: false, leftButtonType:.None , rightButtonType:.None)
        
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
