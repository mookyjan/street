//
//  STStreetViewController.swift
//  SampleProject
//
//  Created by Waris Shams on 23/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit
import Alamofire

class STStreetViewController: BaseViewController , CLLocationManagerDelegate , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , PinterestLayoutDelegate  {
   
    @IBOutlet weak var scrollView: UIScrollView!
    var locationManager: CLLocationManager!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var dpImage: UIImageView!
    @IBOutlet weak var viewOfAsk: UIView!
    var imageSelect : Bool?
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
//    var tabSelected  = STTabbarController()
    
    
    
    @IBOutlet weak var activeUserValue: UIImageView!
    @IBOutlet weak var expertUserValue: UIImageView!
    
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!

    
    // MARK:
    // MARK : UIViewController Lifecycle
    // MARK : -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        let jointCell = UINib(nibName: "STJoinCollectionViewCell", bundle: nil)
        self.collectionView!.registerNib(jointCell, forCellWithReuseIdentifier: "STJoinCollectionViewCell")
        
        let inviteCell  =  UINib(nibName: "STInviteCollectionViewCell", bundle: nil)
        self.collectionView!.registerNib(inviteCell, forCellWithReuseIdentifier: "STInviteCollectionViewCell")
        
        let sharedStoryCell  =  UINib(nibName: "STSharedStoryCollectionViewCell", bundle: nil)
        self.collectionView!.registerNib(sharedStoryCell, forCellWithReuseIdentifier: "STSharedStoryCollectionViewCell")
      
        let admintNotify = UINib(nibName: "STAdminNotificationCollectionCell", bundle: nil)
        self.collectionView!.registerNib(admintNotify, forCellWithReuseIdentifier: "STAdminNotificationCollectionCell")
        
        let followColectionCell = UINib(nibName: "STFollowCollectionViewCell", bundle: nil)
        self.collectionView!.registerNib(followColectionCell, forCellWithReuseIdentifier: "STFollowCollectionViewCell")
        
        let acceptRejectCell = UINib(nibName: "STAcceptRejectCollectionCell", bundle: nil)
        self.collectionView!.registerNib(acceptRejectCell, forCellWithReuseIdentifier: "STAcceptRejectCollectionCell")
        
        let sharedStoryPic = UINib(nibName: "STSharedStoryWithPicCollectionViewCell", bundle: nil)
        self.collectionView!.registerNib(sharedStoryPic, forCellWithReuseIdentifier: "STSharedStoryWithPicCollectionViewCell")

        
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        //        collectionView!.backgroundColor = UIColor.clear
        collectionView!.contentInset = UIEdgeInsets(top: 0, left: -3 , bottom: 10, right: -3)

        
        self.collectionView.delegate = self
        
    
        
        
        //Initializations
        initializations()
        //SetupView
        //
        setUpView()
    }
    
        override func viewWillAppear(animated: Bool) {
       self.navigationController?.navigationBarHidden = true

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    override func viewDidAppear(animated: Bool)
    {
//        self.collectionView!
//        var atScrollPosition = indexPath()
//        var animated = UICollectionViewScrollPositionCenteredVertically()
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        
    }
    
    func setUpView()
    {
      self.view.layoutIfNeeded()
//      self.setupNavigationBarTitle("STREET", showRightButton: false, leftButtonType:.None , rightButtonType:.None)
       
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
     //    lblName?.text =  UIDevice.currentDevice().name
//        UtilityFunctions .setViewBorder(btnAsk_Pressed!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))
       
        
        UtilityFunctions.setTheViewOpacity(viewOfAsk)
    }
    
    func initializations()
    {
        let tapGestureRecognizerforDp = UITapGestureRecognizer(target:self, action:#selector(STStreetViewController.imageTappedForDp(_:)))
        dpImage.userInteractionEnabled = true
        dpImage.addGestureRecognizer(tapGestureRecognizerforDp)
        
        let tapGestureRecognizerforProfile = UITapGestureRecognizer(target:self, action:#selector(STStreetViewController.imageTappedForProfile(_:)))
        profilePic.userInteractionEnabled = true
        profilePic.addGestureRecognizer(tapGestureRecognizerforProfile)
        
        let tapGestureRecognizerforNameLabel = UITapGestureRecognizer(target:self, action:#selector(STStreetViewController.clickOnNameLbl(_:)))
      //  lblName.userInteractionEnabled = true
      //  lblName.addGestureRecognizer(tapGestureRecognizerforNameLabel)
        self.view!.layoutIfNeeded()
        profilePic.layoutIfNeeded()
        
     
    
    
    }
    
   
    
    // MARK : TapGesture

    
    func imageTappedForDp(img: AnyObject)
    {
        imageSelect = false
        showActionSheet()
    }
    
    func imageTappedForProfile(img: AnyObject)
    {
        imageSelect = true
        showActionSheet()
    }
    
    
    func clickOnNameLbl(img: AnyObject)
    {
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
   
    @IBAction func btnGoToSettingVC(sender: AnyObject)
    {
      let vc  = self.storyboard!.instantiateViewControllerWithIdentifier("STMoreContainerViewController") as? STMoreContainerViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnLikePresd(sender: AnyObject)
    {
        
    
    }
    
    @IBAction func btnAskPresed(sender: AnyObject)
    {
    let askVc = self.storyboard?.instantiateViewControllerWithIdentifier("STAskViewController") as? STAskViewController
    self.navigationController?.pushViewController(askVc!, animated: true)
        
    
    }
    
    
    override func viewDidLayoutSubviews() {
//        scrollView.contentSize.height = self.collectionView.frame.height+500
    }
    
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        if (scrollView == self.scrollView) {
//            scrollView.contentSize.height = self.collectionView.frame.height+500
//        }
//    }
//    
    
    // MARK:
    // MARK : ImagePicker
    // MARK : -

    
    func camera()
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(myPickerController, animated: true, completion: nil)
        
    }
    
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    
    func photoLibrary()
    {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(myPickerController, animated: true, completion: nil)
        
    }
    
    // MARK:
    // MARK : ImagePickerDelegate Method
    // MARK : -
    
    override func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
       
        if imageSelect == true
        {
           
//            let cgFloat: CGFloat = profilePic.frame.size.width/2.0
//            let someFloat = Float(cgFloat)
             profilePic.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//             UtilityFunctions.setViewCornerRadius(profilePic, radius:someFloat)

            
//            let image =
//            btnProfilePresed.setImage(UIImage(named: ), forState: UIControlState.Normal)

        }
        else
        {
            dpImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

   
    // MARK:
    // MARK : Status Bar Work
    // MARK : -

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
   
    
   
    
    // MARK:
    // MARK : CurrentLocation Work
    // MARK : -
    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
//    {
//        let userLocation:CLLocation = locations[0] 
//        let long = userLocation.coordinate.longitude;
//        let lat = userLocation.coordinate.latitude;
//        print(lat)
//        print(long)
//        
//        
//    }
//    
   
  func locationManager(manager: CLLocationManager,
                         didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
//        var cityName :String?
//        var countryName : String?
//        
//        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse {
//            locationManager.startUpdatingLocation()
//            let geoCoder = CLGeocoder()
//            let location = CLLocation(latitude:  (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
//            geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
//                var placeMark: CLPlacemark!
//                placeMark = placemarks?[0]
//            if let city = placeMark.addressDictionary!["City"] as? NSString {
//                 cityName = city as String
//                
//                }
//        
//                if let country = placeMark.addressDictionary!["Country"] as? NSString {
//                    countryName = country as String
//                    
//                }
//                self.lblAddress!.text =  cityName! + ", " + countryName!
//                
//        })
//
//     
//            
//     }
  }
    
    func triggerLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            if locationManager.respondsToSelector(#selector(CLLocationManager.requestWhenInUseAuthorization)) {
                locationManager.requestWhenInUseAuthorization()
            } else {
                startUpdatingLocation()
            }
        }
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
        
    }

   
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
    
//STSuggestionCollectionViewCell

    // MARK:
    // MARK : UICollectionViewDelegate
    // MARK : -
 
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 7
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
    if  indexPath.row == 0
        {
        let jointCell = collectionView.dequeueReusableCellWithReuseIdentifier("STJoinCollectionViewCell", forIndexPath: indexPath) as! STJoinCollectionViewCell
            return jointCell
        }
        else if indexPath.row == 1
        {
            let inviteCell = collectionView.dequeueReusableCellWithReuseIdentifier("STInviteCollectionViewCell", forIndexPath: indexPath) as! STInviteCollectionViewCell
             return inviteCell
        }
        
       else if indexPath.row == 2
        {
            let sharedStoryCell = collectionView.dequeueReusableCellWithReuseIdentifier("STSharedStoryCollectionViewCell", forIndexPath: indexPath) as! STSharedStoryCollectionViewCell
            return sharedStoryCell
        }
            
        else if indexPath.row == 3
        {
            let admintNotify = collectionView.dequeueReusableCellWithReuseIdentifier("STAdminNotificationCollectionCell", forIndexPath: indexPath) as! STAdminNotificationCollectionCell
            return admintNotify
        }
        else if indexPath.row == 4
        {
            let followColectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("STFollowCollectionViewCell", forIndexPath: indexPath) as! STFollowCollectionViewCell
            
            return followColectionCell

            
        }
        else if indexPath.row == 5
        {
            let acceptRejectCell = collectionView.dequeueReusableCellWithReuseIdentifier("STAcceptRejectCollectionCell", forIndexPath: indexPath) as! STAcceptRejectCollectionCell
            return acceptRejectCell
            
            
        }
        else if indexPath.row ==  6
        {
       
            let sharedStoryWithPicCell = collectionView.dequeueReusableCellWithReuseIdentifier("STSharedStoryWithPicCollectionViewCell", forIndexPath: indexPath) as! STSharedStoryWithPicCollectionViewCell
            return sharedStoryWithPicCell
       }
        
       else
        {
            let adminNotify = collectionView.dequeueReusableCellWithReuseIdentifier("STAdminNotificationCollectionCell", forIndexPath: indexPath) as! STAdminNotificationCollectionCell
            adminNotify.lblName.text = "Wawoo"
            
            return adminNotify
        }
        
    }
    
    
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath , withWidth:CGFloat) -> CGFloat
    {
        let adminNotify = STAdminNotificationCollectionCell.fromNib()
        let inviteCell = STInviteCollectionViewCell.fromNib()
        let sharedStory = STSharedStoryCollectionViewCell.fromNib()
        let followColectionCell = STFollowCollectionViewCell.fromNib()
        let acceptRejectCell = STAcceptRejectCollectionCell.fromNib()
        let sharedStoryWithPic = STSharedStoryWithPicCollectionViewCell.fromNib()
//        let cellWidth = collectionView.frame.size.width / 2 - 5
        if indexPath.row == 0
        {
            if  let cell = STJoinCollectionViewCell.fromNib()
            {
                //                return CGSizeMake(cellWidth , (cell.contentView.frame.height))
                return cell.contentView.frame.height
                
            }
            
        }
            
        else if(indexPath.row == 1)
        {
            return  inviteCell!.contentView.frame.height
            
            
        }
            
        else if(indexPath.row == 2)
        {
            return sharedStory!.contentView.frame.height
        }
        else if(indexPath.row == 3)
        {
            return adminNotify!.contentView.frame.height
            
        }
        else if(indexPath.row == 4)
        {
            return followColectionCell!.contentView.frame.height
            
        }
        else if(indexPath.row == 5)
        {
            return acceptRejectCell!.contentView.frame.height
            
        }
        else if(indexPath.row == 6)
        {
            return sharedStoryWithPic!.contentView.frame.height
            
        }
            
        else
        {
            return adminNotify!.contentView.frame.height
            
        }
        
        return adminNotify!.contentView.frame.height

    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
// 
//        let adminNotify = STAdminNotificationCollectionCell.fromNib()
//        let inviteCell = STInviteCollectionViewCell.fromNib()
//        let sharedStory = STSharedStoryCollectionViewCell.fromNib()
//        let followColectionCell = STFollowCollectionViewCell.fromNib()
//        let acceptRejectCell = STAcceptRejectCollectionCell.fromNib()
//        let sharedStoryWithPic = STSharedStoryWithPicCollectionViewCell.fromNib()
//        let cellWidth = collectionView.frame.size.width / 2 - 5
//        if indexPath.row == 0
//        {
//         if  let cell = STJoinCollectionViewCell.fromNib()
//         {
////                return CGSizeMake(cellWidth , (cell.contentView.frame.height))
//            return cell.contentView.frame.height
//           
//            }
//        
//        }
//      
//        else if(indexPath.row == 1)
//        {
//            return  inviteCell!.contentView.frame.height
//       
//        
//        }
//            
//        else if(indexPath.row == 2)
//        {
//            return sharedStory!.contentView.frame.height
//        }
//        else if(indexPath.row == 3)
//        {
//            return CGSizeMake(cellWidth , (adminNotify!.contentView.frame.height))
//            
//        }
//        else if(indexPath.row == 4)
//        {
//            return CGSizeMake(cellWidth , (sharedStoryWithPic!.contentView.frame.height))
//            
//        }
//        else if(indexPath.row == 5)
//        {
//            return CGSizeMake(cellWidth , (acceptRejectCell!.contentView.frame.height))
//            
//        }
//        else if(indexPath.row == 6)
//        {
//            return CGSizeMake(cellWidth , (followColectionCell!.contentView.frame.height))
//            
//        }
//            
//        else
//        {
//            return CGSizeMake(cellWidth , (adminNotify!.contentView.frame.height))
//            
//        }
//        
//        return CGSizeMake(300 , 300)
//
//    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        // Compute the dimension of a cell for an NxN layout with space S between
//        // cells.  Take the collection view's width, subtract (N-1)*S points for
//        // the spaces between the cells, and then divide by N to find the final
//        // dimension for the cell's width and height.
//        
//        let cellsAcross: CGFloat = 3
//        let spaceBetweenCells: CGFloat = 1
//        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
//        return CGSizeMake(dim, dim)
//    }
//    
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
//        return 20
//    }
//    
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat
//    {
//        return 10.0
//    }
    
    @IBAction func btnFollowers_Pressed(sender: UIButton)
    {
     let vcFollowers = self.storyboard?.instantiateViewControllerWithIdentifier("STFollowersViewController")
     self.navigationController?.pushViewController(vcFollowers!, animated: true)
    
    
    }
    
    @IBAction func btnFollowing_Pressed(sender: AnyObject)
    {
    let vcFollowing = self.storyboard?.instantiateViewControllerWithIdentifier("STFollowingViewController")
    self.navigationController?.pushViewController(vcFollowing!, animated: true)

    
    
    }
    
    @IBAction func btnStories_Pressed(sender: UIButton)
    {
//      tabSelected.selectedIndex = 3
        
       
    }
    
    
}
