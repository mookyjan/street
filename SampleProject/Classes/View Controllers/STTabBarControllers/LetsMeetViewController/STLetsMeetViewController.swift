//
//  STLetsMeetViewController.swift
//  SampleProject
//
//  Created by Waris Shams on 23/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STLetsMeetViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sendReceivedSegmentBar: UISegmentedControl!

    
    // MARK:
    // MARK : UIViewController Lifecycle
    // MARK : -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
//       STReceivedInvitationCollectionCell 
//        STSentInvitationCollectionCell
        let receivedCell = UINib(nibName: "STReceivedInvitationCollectionCell", bundle: nil)
        self.collectionView!.registerNib(receivedCell, forCellWithReuseIdentifier: "STReceivedInvitationCollectionCell")
        
        let sentCell = UINib(nibName: "STSentInvitationCollectionCell", bundle: nil)
        self.collectionView!.registerNib(sentCell, forCellWithReuseIdentifier: "STSentInvitationCollectionCell")
        //Initializations
        initializations()
        //SetupView
        setUpView()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.navigationController?.setNavigationBarHidden(false, animated: true)


    }
    
    override func viewDidAppear(animated: Bool)
    {
        
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        
    }
    
    func setUpView()
    {
        self.view.layoutIfNeeded()
        self.setupNavigationBarTitle("Lets Meet", showRightButton: true, leftButtonType:.None, rightButtonType:.Add)
    }
    
    func initializations()
    {
               
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func rightNavigationButtonClicked(sender: AnyObject) {
        let vcInvite = self.storyboard?.instantiateViewControllerWithIdentifier("STSendInvitationViewController")
        self.navigationController?.pushViewController(vcInvite!, animated: true)
    }
    
//     MARK:
//     MARK : UICollectionViewDelegate
//     MARK : -
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        if indexPath.row == 0 {
            let receivedCell = collectionView.dequeueReusableCellWithReuseIdentifier("STReceivedInvitationCollectionCell", forIndexPath: indexPath) as! STReceivedInvitationCollectionCell
            
            
            return receivedCell

        }
         else if indexPath.row == 1
        {
            let sendCell = collectionView.dequeueReusableCellWithReuseIdentifier("STSentInvitationCollectionCell", forIndexPath: indexPath) as! STSentInvitationCollectionCell
            
            return sendCell

        }
      else
        {
            let sendCell = collectionView.dequeueReusableCellWithReuseIdentifier("STSentInvitationCollectionCell", forIndexPath: indexPath) as! STSentInvitationCollectionCell
            
            return sendCell
  
        }
        
    }
    
//  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
//    {
//      let inviteDetailVc =  self.storyboard?.instantiateViewControllerWithIdentifier("STInvetationDetailViewController")
//        
//        self.navigationController?.pushViewController(inviteDetailVc!, animated: true)
//    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
      let cellWidth = collectionView.frame.size.width / 2 - 5
       
        let sendCell = STSentInvitationCollectionCell.fromNib()

        
        if indexPath.row == 0 {
            if  let cell = STReceivedInvitationCollectionCell.fromNib()
            {
                return CGSizeMake(cellWidth , (cell.contentView.frame.height))
            }
        }

        else if(indexPath.row == 1)
        {
            return CGSizeMake(cellWidth , (sendCell!.contentView.frame.height))
        }
        return CGSizeMake(cellWidth , 320)

    }

    


}
