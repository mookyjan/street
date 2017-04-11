//
//  STRestaurantCollectionViewCell.swift
//  STREET
//
//  Created by Waris Shams on 03/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STRestaurantCollectionViewCell: UICollectionViewCell , UITableViewDelegate , UITableViewDataSource
{

    
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var lblRestaurantName: UILabel!
    @IBOutlet weak var btnCheckIn: UIButton!
    @IBOutlet weak var btnMeetHer: UIButton!
    
    var restaurantCategories: AnyObject!

    
    
    
  
    
    

func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return 10 ;
    
  }
  
 
    
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
 {
 
    let cell = tableView.dequeueReusableCellWithIdentifier("STRestaurantCategoriesTableViewCell") as? STRestaurantCategoriesTableViewCell
   cell?.textLabel?.text = "Ahmad"
    return cell!
 
 }
    @IBAction func btnCheckIn(sender: AnyObject)
    {
    
    }
    
    @IBAction func btnMeetHer(sender: AnyObject)
    {
    
    }
    
    @IBAction func btnBuyClick(sender: AnyObject)
    {
    
    
    
    }
}
