//
//  STGetAllUsersViewController.swift
//  STREET
//
//  Created by Ahmad on 05/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class STGetAllUsersViewController: BaseViewController , UITableViewDelegate , UITableViewDataSource , FollowUnFollowDelegate
{
    
    let allUserResult : NSMutableArray? = []
    var images : NSMutableArray? = []
    var selectedButton : NSMutableArray? = []

    @IBOutlet weak var tblView: UITableView!
    // MARK:
    // MARK : UIViewController Lifecycle
    // MARK : -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Initializations
        
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
//        getAllUsersList()
        
        for  i in 0..<self.images!.count
        {
            selectedButton?.addObject("NO")
            print("print it \(i)")
        }
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
//        self.setupNavigationBarTitle("ASK", showRightButton: true, leftButtonType: .Cross, rightButtonType:.Tick)
//     getAllUsersList()
        
    
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
    
    
    //    https://nutonia.herokuapp.com/api/v1/users/1/follow
    
    func getAllUsersList()
    {
        let dict =
            [
                "email":"\(UserManager.currentUser!.userEmail!)"
                
            ]
        let params = ["user":dict]
        SVProgressHUD.show()
        Alamofire.request(.PUT, AppConstants.kAPIBaseURL + AppConstants.KAPIUserUrl + "\(UserManager.currentUser!.userID!)" + AppConstants.KAPIAllUsers , parameters: params, encoding:  .JSON)
            .validate()
            
            .responseJSON { [weak self] response in
                
                SVProgressHUD.dismiss()

                switch response.result {
                case .Success(let responseContent):
                    print(response.result)
                    print(responseContent)
                    let allUsers = responseContent["results"]!!["all_users"] as! [NSDictionary]
                    for user in allUsers{
                        self!.allUserResult!.addObject(MOAllUser.init(object: user))
                    }
                    
                    self!.tblView.reloadData()
                    break
                case .Failure(let error):
                    
                    [self?.showAlertViewWithTitle(AppConstants.kEmptyString, message: "Failure")]
                    
                    print(error)
                    break
                }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
        
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "STAllUserCustomCell";
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? STAllUserCustomCell
        let user = allUserResult![indexPath.row] as? MOAllUser
        cell?.delegate = self
        
        cell!.btnFollowUnFollow.tag = indexPath.row
        if (selectedButton![indexPath.row] as! String == "NO") {
            cell!.btnFollowUnFollow.selected = false
        }
        else {
            cell!.btnFollowUnFollow.selected = true
        }

        
        
        cell?.lblUserName.text = user?.userNames
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
    
    
    
}
