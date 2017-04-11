//
//  STPhoneContactViewController.swift
//  STREET
//
//  Created by Waris Shams on 27/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STPhoneContactViewController: BaseViewController, UISearchResultsUpdating {
   
    @IBOutlet weak var viewOfALLContact: UIView!
    @IBOutlet weak var viewOfStreetUser: UIView!
    @IBOutlet weak var viewOfFavouriteUser: UIView!
    @IBOutlet weak var btnGetALL: UIButton!
    @IBOutlet weak var btnStreetContact: UIButton!
    @IBOutlet weak var btnFavouriteContact: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var resultSearchController = UISearchController()

    // MARK:
    // MARK : UIViewController Lifecycle
    // MARK : -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Initializations
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.hidesNavigationBarDuringPresentation = false
//            resultSearchController.showsCancelButton = true
//            resultSearchController.searchBarStyle = UISearchBarStyle.Prominent
            controller.searchBar.sizeToFit()
           
            self.navigationItem.titleView = controller.searchBar;

            
            return controller
        })()
        initializations()
        //SetupView
        setUpView()
    }
    
    override func viewWillAppear(animated: Bool)
    {
//        self.searchBarView()
        btnStreetContact.selected = true
        viewOfStreetUser.hidden = false
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        
    }
    
    func setUpView()
    {
        self.view.layoutIfNeeded()
        self.setupNavigationBarTitle("Followers", showRightButton: true, leftButtonType: .Back, rightButtonType:.Tick)
    }
    
    func initializations()
    {
        viewOfStreetUser.hidden = true
        viewOfALLContact.hidden = true
        viewOfFavouriteUser.hidden = true
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func leftNavigationButtonClicked(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func rightNavigationButtonClicked(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

     @IBAction func btnGetStreetContact_Pressed(sender: UIButton)
    {
//        sender.selected = !sender.selected
        btnGetALL.selected = false
        btnFavouriteContact.selected   = false
        viewOfStreetUser.hidden = false
        viewOfALLContact.hidden = true
        viewOfFavouriteUser.hidden = true
  }
    @IBAction func btnGetAllContact_Pressed(sender: UIButton) {
        
        sender.selected = !sender.selected
        btnStreetContact.selected = false
        btnFavouriteContact.selected   = false
        viewOfALLContact.hidden = false
        
        viewOfStreetUser.hidden = true
        viewOfFavouriteUser.hidden = true



    }
  
    @IBAction func btnGetFavouriteUser_Pressed(sender: UIButton)
    {
        sender.selected = !sender.selected
        btnStreetContact.selected = false
        btnGetALL.selected = false
        viewOfFavouriteUser.hidden = false
        
        viewOfStreetUser.hidden = true
        viewOfALLContact.hidden = true



    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 7
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell =  tableView.dequeueReusableCellWithIdentifier("STPhoneContactViewController")! as UITableViewCell
        return cell
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
//        filteredTableData.removeAll(keepCapacity: false)
//        
//        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text)
//        let array = (tableData as NSArray).filteredArrayUsingPredicate(searchPredicate)
//        filteredTableData = array as! [String]
        
        self.tableView.reloadData()
    }
}
