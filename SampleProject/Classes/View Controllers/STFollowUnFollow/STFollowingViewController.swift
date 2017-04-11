//
//  STFollowingViewController.swift
//  STREET
//
//  Created by Waris Shams on 27/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STFollowingViewController: BaseViewController , UITableViewDelegate , UITableViewDataSource , FollowUnFollowDelegate {
  
    var images : NSMutableArray? = []
    var selectedButton : NSMutableArray? = []
    @IBOutlet weak var tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationBarTitle("Follower List", showRightButton: false, leftButtonType: .Back, rightButtonType:.None)
        images = [
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
            UIImage(named: "image3")!,
            UIImage(named: "image3")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
            UIImage(named: "image3")!,
            UIImage(named: "image3")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
        ]
        
        for  i in 0..<self.images!.count
        {
            selectedButton?.addObject("NO")
        }

   
    
    }
    
    override func leftNavigationButtonClicked(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "STFollowingViewController";
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? STAllUserCustomCell
//        let user = allUserResult![indexPath.row] as? MOAllUser
        cell?.delegate = self
        
        cell!.btnFollowUnFollow.tag = indexPath.row
        if (selectedButton![indexPath.row] as! String == "NO") {
            cell!.btnFollowUnFollow.selected = false
        }
        else {
            cell!.btnFollowUnFollow.selected = true
        }
        
        
        
        cell?.lblUserName.text = "John"
        let image = images![indexPath.row]
        
        cell!.imageOfUser.image = image as? UIImage
        
        
        //        let myBlock: SDWebImageCompletionBlock! = {(image: UIImage!, error: NSError!, cacheType: SDImageCacheType!, imageURL: NSURL!) -> Void in
        //        }
        
        //        cell?.imageOfUser?.sd_setImageWithURL(NSURL(string:(user!.userProfilePicture)), placeholderImage: UIImage(named: "image"), options: SDWebImageOptions.ProgressiveDownload, completed: myBlock)
        
        
        
        return cell!;
    }

    func followUnFollow(cell: STAllUserCustomCell) {
        let x = Int(cell.btnFollowUnFollow.tag)         //get the table's row
        
        if cell.btnFollowUnFollow.selected {
            selectedButton![x] = "YES"
            cell.btnFollowUnFollow.selected = true
        }
        else if !cell.btnFollowUnFollow.selected {
            selectedButton![x] = "NO"
            cell.btnFollowUnFollow.selected = false
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
