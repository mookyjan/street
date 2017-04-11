//
//  STAskViewController.swift
//  SampleProject
//
//  Created by Waris Shams on 26/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit
import Alamofire

class STAskViewController: BaseViewController {

    @IBOutlet weak var btnAll_Pressed: UIButton!
    @IBOutlet weak var btnFew_Pressed: UIButton!
    @IBOutlet weak var txtViewAskQuestion: UITextView!
    // MARK:
    // MARK : UIViewController Lifecycle
    // MARK : -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Initializations
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
        self.setupNavigationBarTitle("ASK", showRightButton: true, leftButtonType: .Cross, rightButtonType:.Tick)
        txtViewAskQuestion.becomeFirstResponder()
        

        UtilityFunctions .setViewBorder(btnAll_Pressed!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))
        
        UtilityFunctions .setViewBorder(btnFew_Pressed!, withWidth: 5, andColor: UIColor(red: 0.42, green: 0.74, blue: 0.99, alpha: 1.0))


    }
    
    func initializations()
    {
        txtViewAskQuestion.placeholder = "Please Ask Any Question... ?"
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func leftNavigationButtonClicked(sender: AnyObject) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: {
            
        })
    }

        
    override func rightNavigationButtonClicked(sender: AnyObject)
    {
        
        
       
        if isViewQuestionValidation()
        {
        let dict =
            [       "ask" : txtViewAskQuestion.text! ,
            
            ]
        let params = ["asks":dict]
        SVProgressHUD.show()
        Alamofire.request(.POST, AppConstants.kAPIBaseURL + AppConstants.KAPIAskQuestion , parameters: params, encoding:.JSON)
            .validate()
            .responseJSON { [weak self] response in
                SVProgressHUD.dismiss()
                
                switch response.result {
                case .Success(let responseContent):
                   print(responseContent)
                   
                    self?.showAlertViewWithTitle(AppConstants.kEmptyString, message: "Success", dismissCompletion: { 
                        self!.navigationController?.popViewControllerAnimated(true)
                    
                    })
                    
                    break
                case .Failure(let error):
                    
                    print(error)
                    break
                }
        }
    }
}
   
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnFew_Pressed(sender: AnyObject)
    {
        if UserManager.currentUser?.userID == nil
        {
            
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: "Please Login First", dismissCompletion: {
                let vcLogin = self.storyboard?.instantiateViewControllerWithIdentifier("STLoginViewController")
                let nvcLogin = UINavigationController.init(rootViewController: vcLogin!)
                self.presentViewController(nvcLogin, animated: true) {
                    
                }
            })
        }
        else
        {
        
        
      let allUserVc  =  self.storyboard?.instantiateViewControllerWithIdentifier("STGetAllUsersViewController")
     self.navigationController?.pushViewController(allUserVc!, animated: true)
        
       }
    
    }
    
    func isViewQuestionValidation() -> Bool
    {
        var validInput = true
        
        if self.txtViewAskQuestion.text!.length <  AppConstants.kUserNameRequiredLength {
            validInput = false
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.kValidationMessageMissingInput, dismissCompletion: {
                
            })
            self.txtViewAskQuestion.becomeFirstResponder()
        }
    return validInput
    }
    
}
