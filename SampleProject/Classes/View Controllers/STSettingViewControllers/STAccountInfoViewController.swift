//
//  STAccountInfoViewController.swift
//  STREET
//
//  Created by Waris Shams on 27/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STAccountInfoViewController: BaseViewController , UITextFieldDelegate {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtContactNumber: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // MARK:
    // MARK : UIViewController Lifecycle
    // MARK : -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(STAccountInfoViewController.imageTapped(_:)))
//        
//        // add it to the image view;
//        profileImage.addGestureRecognizer(tapGesture)
//        profileImage.userInteractionEnabled = true
        

        //Initializations.
       
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
        self.setupNavigationBarTitle("Account", showRightButton: false, leftButtonType:.Back, rightButtonType:.None)
        UtilityFunctions .setViewBorder(btnDone!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))
        
    }
    
    func initializations()
    {
        txtEmail .setupLeftViewWithImage(UIImage(named: "email-icon"))
        txtPassword .setupLeftViewWithImage(UIImage(named: "account"))
        txtContactNumber .setupLeftViewWithImage(UIImage(named: "phone-icon"))
        txtLocation .setupLeftViewWithImage(UIImage(named: "location-icon"))

        txtEmail.delegate = self
        txtPassword.delegate =  self
        txtContactNumber.delegate = self
        txtLocation.delegate =  self
        
//        let tapGestureRecognizerforProfile = UITapGestureRecognizer(target:self, action:#selector(STAccountInfoViewController.tappedOnProfile(_:)))
//        profileImage.userInteractionEnabled = true
//        profileImage.addGestureRecognizer(tapGestureRecognizerforProfile)
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
   
    override func viewDidLayoutSubviews() {
        scrollView.contentSize = CGSizeMake(0, 700)
        
    }
    
    
    override func leftNavigationButtonClicked(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func btnDone_Pressed(sender: AnyObject)
    {
        if isViewPassedAccountinfoValidatio()
        {
            self.navigationController?.popViewControllerAnimated(true)
        }

    }
//    func imageTapped(gesture: UIGestureRecognizer) {
//    
//     showActionSheet()
//    
//    }
//    
//    func showActionSheet() {
//        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
//        
//        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction!) -> Void in
//            self.camera()
//        }))
//        
//        actionSheet.addAction(UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction!) -> Void in
//            self.photoLibrary()
//        }))
//        
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
//        
//        self.presentViewController(actionSheet, animated: true, completion: nil)
//        
//    }
// 
//    func photoLibrary()
//    {
//        
//        let myPickerController = UIImagePickerController()
//        myPickerController.delegate = self;
//        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//        
//        self.presentViewController(myPickerController, animated: true, completion: nil)
//        
//    }
//
//    func camera()
//    {
//        let myPickerController = UIImagePickerController()
//        myPickerController.delegate = self;
//        myPickerController.sourceType = UIImagePickerControllerSourceType.Camera
//        
//        self.presentViewController(myPickerController, animated: true, completion: nil)
//        
//    }
//    
//    override func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
//    {
//        
//        let cgFloat: CGFloat = profileImage.frame.size.width/2.0
//            let someFloat = Float(cgFloat)
//            profileImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//            UtilityFunctions.setViewCornerRadius(profileImage, radius:someFloat)
//            self.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    override func imagePickerControllerDidCancel(picker: UIImagePickerController) {
//        dismissViewControllerAnimated(true, completion: nil)
//    }

    func isViewPassedAccountinfoValidatio()-> Bool
    {
        
        var validInput = true
       
        if !UtilityFunctions.isValidEmailAddress(txtEmail.text) {
            validInput = false
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.kValidationEmailInvalidInput, dismissCompletion: {
                self.txtEmail.becomeFirstResponder()
                
            })
        }
        
        else if   txtPassword.text!.length < AppConstants.kPasswordRequiredLength {
            validInput = false
            
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.KValidationPassword, dismissCompletion: {
                self.txtPassword.becomeFirstResponder()
            })
        }
        else if self.txtContactNumber.text!.length < AppConstants.kPhoneNumberRequiredLength {
            validInput = false
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.KValidationOfPhoneNumber, dismissCompletion: {
                self.txtContactNumber.becomeFirstResponder()
            })
        }
//        else if   txtEmail.text!.length < AppConstants.kPasswordRequiredLength {
//            validInput = false
//            
//            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.kValidationMessageMissingInput, dismissCompletion: {
//                self.txtEmail.becomeFirstResponder()
//                
//            })
//        }
        
        
        else if txtLocation.text!.length < AppConstants.kCityNameRequiredLength
        {
            validInput = false
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.kValidationCityName, dismissCompletion: {
                self.txtLocation.becomeFirstResponder()
            })
            
        }
        
        
        return validInput
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
