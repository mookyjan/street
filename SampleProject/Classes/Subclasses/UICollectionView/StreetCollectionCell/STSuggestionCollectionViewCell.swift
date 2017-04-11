
//
//  STSuggestionCollectionViewCell.swift
//  STREET
//
//  Created by Waris Shams on 04/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STSuggestionCollectionViewCell: UICollectionViewCell , UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var profileImageOfSuggestion: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var lblAskQuestion: UILabel!
    @IBOutlet weak var btnSuggestions: UIButton!
    
    override func awakeFromNib() {
   
        tblView.registerNib(UINib(nibName: "STSuggestionTableViewCell", bundle: nil), forCellReuseIdentifier: "STSuggestionTableViewCell")
    
        
        UtilityFunctions.setTheViewOpacity(self)
        
        UtilityFunctions .setViewBorder(btnSuggestions!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))
        
    }
    

//    override func intrinsicContentSize() -> CGSize {
//    
//        
//        
//    }
    
    
    // MARK:
    // MARK : // MARK:    -
    // MARK: TableViewDelegate -
  
    
   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "STSuggestionTableViewCell";
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? STSuggestionTableViewCell
        
        cell!.suggestedProfifilePic.image = UIImage(named:"TM-levin-logo")
         cell!.lblLike.text = "300"
         return cell!;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let estimatedheight = tableView.contentSize.height
        
        let makeHeight = CGSizeMake(tableView.frame.size.width, estimatedheight)
        
        tableView.frame.size = makeHeight
        
        return 200.0 ;
    }
   
    @IBAction func btnSuggestion_Pressed(sender: AnyObject)
    {
    
    
    }
    
    
}
