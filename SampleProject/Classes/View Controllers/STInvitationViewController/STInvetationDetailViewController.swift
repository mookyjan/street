//
//  STInvetationDetailViewController.swift
//  SampleProject
//
//  Created by Ahmad on 24/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STInvetationDetailViewController: BaseViewController , UICollectionViewDelegate , UICollectionViewDataSource {

    @IBOutlet weak var imageDp: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var lblOfAddress: UILabel!
    @IBOutlet weak var lblOfContactNumber: UILabel!
    @IBOutlet weak var lblOfDate: UILabel!
    @IBOutlet weak var lblOfDescriptions: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    // MARK:
    // MARK : UIViewController Lifecycle
    // MARK : -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        let inviteDetailCell = UINib(nibName: "STDetailInvetationCollectionCell", bundle: nil)
        self.collectionView!.registerNib(inviteDetailCell, forCellWithReuseIdentifier: "STDetailInvetationCollectionCell")
//        UIApplication.sharedApplication().statusBarHidden = true

        //Initializations
        initializations()
        //SetupView
        setUpView()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
//        self.collectionView.reloadData()
        self.collectionView.superview?.layoutSubviews()
        self.collectionView.layoutIfNeeded()
        
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        
    }
    
    func setUpView()
    {
        self.view.layoutIfNeeded()
//        self.setupNavigationBarTitle("Invite Detail", showRightButton: false, leftButtonType:.Back, rightButtonType:.None)
        lblOfAddress.text = "UK London"

    }
    
    func initializations()
    {
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
   
    
    // MARK : btnPressed Lifecycle
    
   @IBAction func btnAccept_Pressed(sender: AnyObject) {
    
    }
    
    @IBAction func btnReject_Pressed(sender: AnyObject) {
    
    }
    
    @IBAction func btnBack_Pressed(sender: AnyObject)
    {
//      self.navigationController?.dismissViewControllerAnimated(true, completion: { 
//        
//      })
       self.dismissViewControllerAnimated(true) {
    
        }
    }
    
    
    // MARK:
    // MARK : UICollectionView Lifecycle
    // MARK : -
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 6
    }
 
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let inviteDetailCell = collectionView.dequeueReusableCellWithReuseIdentifier("STDetailInvetationCollectionCell", forIndexPath: indexPath) as! STDetailInvetationCollectionCell
        
        return inviteDetailCell

    }
     
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
       let cellWidth = collectionView.frame.size.width / 3 - 5

        return CGSizeMake(cellWidth , 126)
        
    }
    

    

}
