//
//  STSignUpViewController.swift
//  STREET
//
//  Created by Waris Shams on 28/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit
import Alamofire

class STSignUpViewController: BaseViewController , UITextFieldDelegate {
  
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
  
    @IBOutlet weak var txtCityName: UITextField!

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
        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        
    }
    
    func setUpView()
    {
        self.view.layoutIfNeeded()
        
    }
    
    func initializations()
    {
        txtEmail .setupLeftViewWithImage(UIImage(named: "username"))
        txtPassword .setupLeftViewWithImage(UIImage(named: "password"))
        txtPhoneNumber .setupLeftViewWithImage(UIImage(named: "phone-icon"))
        txtCityName .setupLeftViewWithImage(UIImage(named: "location-icon"))
        
        txtPassword.delegate =  self
        txtEmail.delegate =  self
        txtPhoneNumber.delegate = self
        txtCityName.delegate = self

    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

// MARK : Btn Action Methods
    
    @IBAction func btnSignUpPressed(sender: AnyObject)
    {
       if isViewPassedSignupValidation()
       {
       
       let dict =
            [
                    "email"      : txtEmail.text! ,
                    "password"   : txtPassword.text!,
                    "phone"      : txtPhoneNumber.text!,
                    "city"       : txtCityName.text!,
            ]
        let params = ["user":dict]
        SVProgressHUD.show()
        Alamofire.request(.POST, AppConstants.kAPIBaseURL  + AppConstants.KAPIUserUrl + AppConstants.kAPISignupPath , parameters: params, encoding:.JSON)
                .validate()
                .responseJSON { [weak self] response in
                    SVProgressHUD.dismiss()
                    print(AppConstants.kAPIBaseURL  + AppConstants.KAPIUserUrl + AppConstants.kAPISignupPath)
                    
                    
                    switch response.result {
                    case .Success(let responseContent):
                    print(responseContent)
                        
                    break
                    case .Failure(let error):
                    [self?.showAlertViewWithTitle(AppConstants.kEmptyString, message: "NetWork Error")]

                        print(error)
                        break
                    }
            }
            
        }
       }
   
    @IBAction func btnBackPressed(sender: AnyObject)
    {
      self.navigationController?.popViewControllerAnimated(true)
    
    }
   
    @IBAction func btnSkipLoginPressed(sender: AnyObject)
    {
        let vcSignUp:STSignUpViewController = self.storyboard!.instantiateViewControllerWithIdentifier("STSignUpViewController") as! STSignUpViewController
        self.navigationController?.pushViewController(vcSignUp, animated: true)

     
    }
    

    
    func isViewPassedSignupValidation()-> Bool
    {
        
        var validInput = true
        if self.txtPhoneNumber.text!.length < AppConstants.kPhoneNumberRequiredLength {
            validInput = false
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.KValidationOfPhoneNumber, dismissCompletion: {
                self.txtPhoneNumber.becomeFirstResponder()
            })
        }
     else if   txtEmail.text!.length < AppConstants.kPasswordRequiredLength {
            validInput = false
            
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.kValidationMessageMissingInput, dismissCompletion: {
                self.txtEmail.becomeFirstResponder()
                
            })
        }
        else if !UtilityFunctions.isValidEmailAddress(txtEmail.text) {
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
        else if txtCityName.text!.length < AppConstants.kCityNameRequiredLength
        {
            validInput = false
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.kValidationCityName, dismissCompletion: {
                self.txtCityName.becomeFirstResponder()
          })

        }
        
        
        return validInput
    }
    
    
    // MARK:    -
    // MARK: TextField Delegate -
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
