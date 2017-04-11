//
//  STCheckInViewController.swift
//  SampleProject
//
//  Created by Waris Shams on 23/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STCheckInViewController: BaseViewController ,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , PinterestLayoutDelegate   {

    
    @IBOutlet weak var collectionView: UICollectionView!
  // MARK:
  // MARK : UIViewController Lifecycle
  // MARK : -
   
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        let invitePeople = UINib(nibName: "STInvitePeopleForStoryCollectionCell", bundle: nil)
        self.collectionView!.registerNib(invitePeople, forCellWithReuseIdentifier: "STInvitePeopleForStoryCollectionCell")
        
        let partOfInvite  =  UINib(nibName: "STPartOfInvitationStoryCollectionCell", bundle: nil)
        self.collectionView!.registerNib(partOfInvite, forCellWithReuseIdentifier: "STPartOfInvitationStoryCollectionCell")
        
        let myOwnStory  =  UINib(nibName: "STMyOwnStoryCollectionViewCell", bundle: nil)
        self.collectionView!.registerNib(myOwnStory, forCellWithReuseIdentifier: "STMyOwnStoryCollectionViewCell")
        
        let sharedStoryForPic = UINib(nibName: "STSharedStoryWithPicCollectionViewCell", bundle: nil)
        self.collectionView!.registerNib(sharedStoryForPic, forCellWithReuseIdentifier: "STSharedStoryWithPicCollectionViewCell")
        
        
//        let UserOwnStoryCollectionCell = UINib(nibName: "STUserOwnStoryCollectionCell", bundle: nil)
//        self.collectionView!.registerNib(UserOwnStoryCollectionCell, forCellWithReuseIdentifier: "STUserOwnStoryCollectionCell")

        let storyWithPic = UINib(nibName: "STSharedStoryWithPicCollectionViewCell", bundle: nil)
        self.collectionView!.registerNib(storyWithPic, forCellWithReuseIdentifier: "STSharedStoryWithPicCollectionViewCell")
     
        
        let sharedStory = UINib(nibName: "STSharedStoryCollectionViewCell", bundle: nil)
        self.collectionView!.registerNib(sharedStory, forCellWithReuseIdentifier: "STSharedStoryCollectionViewCell")

        
//        STSharedStoryCollectionViewCell
       
        
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }

        
        //Initializations
         initializations()
        //SetupView
         setUpView()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        
    }
    
    func setUpView()
    {
        self.view.layoutIfNeeded()
        self.setupNavigationBarTitle("My Stories", showRightButton: true, leftButtonType:.None, rightButtonType:.Add)

        
    }
    
    func initializations()
    {
//       self.navigationController?.dismissViewControllerAnimated(true, completion: {
//        let vcLogin = self.storyboard?.instantiateViewControllerWithIdentifier("STLoginViewController")
//       self.navigationController?.pushViewController(vcLogin!, animated: true)
//    
//       })
}
    
//    func didLogin()
//    {
//        let vcLogin = self.storyboard?.instantiateViewControllerWithIdentifier("STLoginViewController")
//        let nvcLogin = UINavigationController.init(rootViewController: vcLogin!)
//        self.presentViewController(nvcLogin, animated: true) {
//    
//        }
//   }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
      
        if  indexPath.row == 0
        {
            let invitePeople = collectionView.dequeueReusableCellWithReuseIdentifier("STInvitePeopleForStoryCollectionCell", forIndexPath: indexPath) as! STInvitePeopleForStoryCollectionCell
            return invitePeople
        }
            
        else if indexPath.row == 1
        {
            let partOfInvite = collectionView.dequeueReusableCellWithReuseIdentifier("STPartOfInvitationStoryCollectionCell", forIndexPath: indexPath) as! STPartOfInvitationStoryCollectionCell
            return partOfInvite
        }
            
        else if indexPath.row == 2
        {
            let myOwnStory = collectionView.dequeueReusableCellWithReuseIdentifier("STMyOwnStoryCollectionViewCell", forIndexPath: indexPath) as! STMyOwnStoryCollectionViewCell
            return myOwnStory
        }
        else if indexPath.row == 3
        {
            let sharedStoryForPic = collectionView.dequeueReusableCellWithReuseIdentifier("STSharedStoryWithPicCollectionViewCell", forIndexPath: indexPath) as! STSharedStoryWithPicCollectionViewCell
            
            return sharedStoryForPic
            
            
        }
    else if indexPath.row ==  4
        {
            
            let sharedStory = collectionView.dequeueReusableCellWithReuseIdentifier("STSharedStoryCollectionViewCell", forIndexPath: indexPath) as! STSharedStoryCollectionViewCell
            return sharedStory
        }
            
        else if indexPath.row ==  5
        {
            
            let sharedStory = collectionView.dequeueReusableCellWithReuseIdentifier("STSharedStoryCollectionViewCell", forIndexPath: indexPath) as! STSharedStoryCollectionViewCell
            return sharedStory
        }
 
            
        else
        {
            let sharedStory = collectionView.dequeueReusableCellWithReuseIdentifier("STSharedStoryCollectionViewCell", forIndexPath: indexPath) as! STSharedStoryCollectionViewCell
            return sharedStory
        }
        
    }
    
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath , withWidth:CGFloat) -> CGFloat
    {
        let partOfInvite = STPartOfInvitationStoryCollectionCell.fromNib()
        let sharedStoryForPic = STSharedStoryWithPicCollectionViewCell.fromNib()
//        let UserOwnStoryCollectionCell = STUserOwnStoryCollectionCell.fromNib()
//        let sharedStoryWithPicCell = STSharedStoryWithPicCollectionViewCell.fromNib()
        let myOwnStory = STMyOwnStoryCollectionViewCell.fromNib()
        let sharedStory = STSharedStoryCollectionViewCell.fromNib()
        

        if indexPath.row == 0
        {
            if  let cell = STInvitePeopleForStoryCollectionCell.fromNib()
            {
                //                return CGSizeMake(cellWidth , (cell.contentView.frame.height))
                return cell.contentView.frame.height
                
            }
            
        }
            
        else if(indexPath.row == 1)
        {
            return  partOfInvite!.contentView.frame.height
            
            
        }
            
        else if(indexPath.row == 2)
        {
            return myOwnStory!.contentView.frame.height
        }
      
        else if(indexPath.row == 3)
        {
            return sharedStoryForPic!.contentView.frame.height+20
            
        }
        else if(indexPath.row == 4)
        {
            return sharedStory!.contentView.frame.height
            
        }
            
            
            
//        else if(indexPath.row == 4)
//        {
//            return UserOwnStoryCollectionCell!.contentView.frame.height
//            
//        }
//        else if(indexPath.row == 4)
//        {
//            return sharedStoryWithPicCell!.contentView.frame.height
//            
//        }
        
        return myOwnStory!.contentView.frame.height
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let storyAndMeetUpDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("STStoriesAndMeetUpDetailViewController")
        self.navigationController?.pushViewController(storyAndMeetUpDetailVC!, animated: true)
    }

    override func rightNavigationButtonClicked(sender: AnyObject) {
        let newStoryVC = self.storyboard?.instantiateViewControllerWithIdentifier("STStoriesBeginViewController")
        self.navigationController?.pushViewController(newStoryVC!, animated: true)
        
    }
    
}
