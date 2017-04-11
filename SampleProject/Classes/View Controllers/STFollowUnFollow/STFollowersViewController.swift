//
//  STFollowersViewController.swift
//  STREET
//
//  Created by Waris Shams on 27/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STFollowersViewController: BaseViewController , UITableViewDataSource , UITableViewDelegate {

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
    
    override func viewWillAppear(animated: Bool)
    {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        
    }
    
    func setUpView()
    {
        self.view.layoutIfNeeded()
        self.setupNavigationBarTitle("Followers", showRightButton: false, leftButtonType: .Back, rightButtonType:.None)
    }
    
    func initializations()
    {
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    override func leftNavigationButtonClicked(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell =  tableView.dequeueReusableCellWithIdentifier("STFollowersViewController")! as UITableViewCell
        
        
        
        return cell
        
        
        
    }

   }
