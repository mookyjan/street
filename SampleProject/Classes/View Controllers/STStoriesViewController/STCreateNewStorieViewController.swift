//
//  STCreateNewStorieViewController.swift
//  STREET
//
//  Created by Ahmad on 26/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STCreateNewStorieViewController: BaseViewController,UITextViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate, removeImageButtonDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var bottomViewBottomSpaceConstant: NSLayoutConstraint!
    @IBOutlet weak var btnCross: UIButton!
    @IBOutlet weak var statusHeightConstant: NSLayoutConstraint!
    @IBOutlet weak var btnAddImage: UIButton!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var txtV_Status: UITextView!
    @IBOutlet weak var constraintScrollViewBottom: NSLayoutConstraint!
    
//    var imagesArray = ["image1_1","image5"]
    var imagesArray : [UIImage] = []
    
    
    
    
    // MARK: - View Controller Life Cycle -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        let invitePeople = UINib(nibName: "STCreateStoryCollectionViewCell", bundle: nil)
//        self.collectionView!.registerNib(invitePeople, forCellWithReuseIdentifier: "STCreateStoryCollectionViewCell")
        //Initializations
        initializations()
        //SetupView
        setUpView()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(STCreateNewStorieViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(STCreateNewStorieViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setTextViewHeight()
        txtV_Status.becomeFirstResponder()
        collectionView.reloadData()
    
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        
    }
    
    func setUpView()
    {
        self.view.layoutIfNeeded()
        self.setupNavigationBarTitle("My Story", showRightButton: true, leftButtonType:.Cross, rightButtonType:.Tick)
        UtilityFunctions.setDropShadowOnView(shadowView, shadowOffset: CGSizeMake(0.5, -1))
    }
    
    func initializations()
    {
        
    }


    // MARK: - Base View Controller Delegate -
    
    override func leftNavigationButtonClicked(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func rightNavigationButtonClicked(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    // MARK: - Buttons Actions -
    @IBAction func btnCrossPressed(sender: AnyObject) {
//        locationView.hidden = true
//        locationView.removeFromSuperview()
//        txtV_Status.resignFirstResponder()
    }
    
    @IBAction func btnAddImagePressed(sender: AnyObject) {
        showActionSheet()
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
    
    func camera()
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(myPickerController, animated: true, completion: nil)
        
    }
    func photoLibrary()
    {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(myPickerController, animated: true, completion: nil)
        
    }
    
    // MARK: - Keyboard Notifications -
    func keyboardWillShow(notification:NSNotification) {
        let userInfo:NSDictionary = notification.userInfo!
        let keyboardFrame:NSValue = userInfo.valueForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.CGRectValue()
        let keyboardHeight = keyboardRectangle.height
        bottomViewBottomSpaceConstant.constant = keyboardHeight-45
        constraintScrollViewBottom.constant =  keyboardHeight 
    }
    
    func keyboardWillHide(notification:NSNotification)  {
        bottomViewBottomSpaceConstant.constant = 0.0
        constraintScrollViewBottom.constant = 0.0
    }
    
    // MARK: - UICollectionView -
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return imagesArray.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let sharedImageCell = collectionView.dequeueReusableCellWithReuseIdentifier("STCreateStoryCollectionViewCell", forIndexPath: indexPath) as! STCreateStoryCollectionViewCell
        sharedImageCell.delegate = self;
        sharedImageCell.imgV_ShareImage.image = imagesArray[indexPath.section]
        
        return sharedImageCell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    // MARK: - CollectionViewCell Delegate -
    
    func deleteButtonPressed(cell: STCreateStoryCollectionViewCell) {
        let indexPath = self.collectionView.indexPathForCell(cell)
//        collectionView.deleteItemsAtIndexPaths(indexPath?.section)
        imagesArray.removeAtIndex((indexPath?.section)!)
        collectionView.animate(.FadeIn, curve: .Linear)
        
        collectionView.reloadData()
    }
    
    
    // MARK: - Image Picker Controller Delegate -
    override func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagesArray.insert((info[UIImagePickerControllerOriginalImage] as? UIImage)!, atIndex: imagesArray.count)
        setTextViewHeight()
        dismissViewControllerAnimated(true) { 
            
        }
        self.collectionView.reloadData()
    }
    
    override func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Text View Delegates -
    func textViewDidChange(textView: UITextView) {
       setTextViewHeight()
    }
    
    func setTextViewHeight() {
        let sizeThatFitsTextView = txtV_Status.sizeThatFits(CGSizeMake(txtV_Status.frame.width, txtV_Status.frame.height))
        statusHeightConstant.constant = sizeThatFitsTextView.height
    }
    
}
