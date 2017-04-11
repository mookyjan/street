//
//  STLoginViewController.swift
//  STREET
//
//  Created by Waris Shams on 27/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

//

import UIKit
import Alamofire

protocol LoginViewDelegate{
    
    func didLogin()
    func didFailToLogInWithResponse()
    
}

class STLoginViewController: BaseViewController , UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    var userAPI: MOUser?
    
    
    var delegate: LoginViewDelegate?
    
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
        emailTextField .setupLeftViewWithImage(UIImage(named: "username"))
        passTextField .setupLeftViewWithImage(UIImage(named: "password"))
        emailTextField.delegate = self
        passTextField.delegate =  self
        
        
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK:
    // MARK : Button Action Method
    // MARK : -
    
    @IBAction func btnSignIn(sender: AnyObject)
    {
//        emailTextField.text = "ahmad1234@gmail.com"
//        passTextField.text = "123456789"
        if isViewPassedSignUpValidation()
        {
            let dict =
                   [
                    "email"    : emailTextField.text!,
                    "password" : passTextField.text! ,
                    ]
          let params = ["user":dict]
            SVProgressHUD.show()
            Alamofire.request(.PUT, AppConstants.kAPIBaseURL + AppConstants.KAPIUserUrl + AppConstants.kAPISigninPath , parameters: params, encoding:  .JSON)
                .validate()
                .responseJSON { [weak self] response in
                    
                    SVProgressHUD.dismiss()
                    print(AppConstants.kAPIBaseURL + AppConstants.kAPISigninPath)
                    switch response.result {
                    case .Success(let responseContent):
                        print(response.result)
                        print(responseContent)

                        let  value =  responseContent["status"]
                        
                        if value === 0
                        {
                            [self?.showAlertViewWithTitle(AppConstants.kEmptyString, message: "Invalid User")]
                        }
                        else
                        {
                        let arrayOfResult = responseContent["results"] as! NSDictionary
                        let userAPi: MOUser?
                        userAPi = MOUser.init(object: arrayOfResult)
                        UserManager.setCurrentUser(userAPi)
                        let tabBarVc = self?.storyboard?.instantiateViewControllerWithIdentifier("STTabbarController")
                        self?.presentViewController(tabBarVc!, animated: true, completion: {
                                
                        })
                            
                        if ((self?.delegate) != nil)
                        {
                            if let delegateData = self!.delegate?.didLogin() {
                                print(delegateData)
                            } else {
                                self?.showAlertViewWithTitle(AppConstants.kEmptyString, message: "Some thing wrong in Delegate")
                            }
                        }
                    }
                        break
                    case .Failure(let error):
                       
                        [self?.showAlertViewWithTitle(AppConstants.kEmptyString, message: "Failure")]

                        if ((self?.delegate) != nil)
                        {
                            if let delegateData = self!.delegate?.didFailToLogInWithResponse() {
                                print(delegateData)
                            } else {
                                self?.showAlertViewWithTitle(AppConstants.kEmptyString, message: "Some thing wrong in Delegate")
                                
                            }
                            
                        }
                        
                        
                        print(error)
                        break
                    }
            }
        }
    }
    
    
    
    @IBAction func btnSignUp_Pressed(sender: AnyObject) {
        let vcSignUp:STSignUpViewController = self.storyboard!.instantiateViewControllerWithIdentifier("STSignUpViewController") as! STSignUpViewController
        self.navigationController?.pushViewController(vcSignUp, animated: true)
    }
    
    @IBAction func btnForgotPass(sender: AnyObject)
    {
        if isViewPassedForgotPasswordValidation()
        {
            let dict =
                [
                    "email": emailTextField.text!
                ]
            let params = ["user":dict]

            SVProgressHUD.show()
            
            Alamofire.request(.PUT, AppConstants.kAPIBaseURL  + AppConstants.KAPIUserUrl + AppConstants.kAPIForgotPasswordPath  , parameters: params, encoding:  .JSON)
                .validate()
                .responseJSON { [weak self] response in
                    SVProgressHUD.dismiss()
                    
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
    
    
    // MARK : View Validation
    
    func isViewPassedForgotPasswordValidation() -> Bool
    {
        var validInput = true
        
        if self.emailTextField.text!.length <  AppConstants.kUserNameRequiredLength {
            validInput = false
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.kValidationMessageMissingInput, dismissCompletion: {
                
            })
            self.emailTextField.becomeFirstResponder()
        }
            
        else if !UtilityFunctions.isValidEmailAddress(emailTextField.text) {
            validInput = false
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.kValidationEmailInvalidInput, dismissCompletion: {
                
            })
            emailTextField.becomeFirstResponder()
        }
        
        return validInput
        
    }
    
    func isViewPassedSignUpValidation() -> Bool
    {
        var validInput = true
        if self.emailTextField.text!.length < AppConstants.kUserNameRequiredLength {
            validInput = false
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.kValidationMessageMissingInput, dismissCompletion: {
                self.emailTextField.becomeFirstResponder()
            })
            
        }
        else if !UtilityFunctions.isValidEmailAddress(emailTextField.text) {
            validInput = false
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.kValidationEmailInvalidInput, dismissCompletion: {
                self.emailTextField.becomeFirstResponder()
            })
        }
        else if   self.passTextField.text!.length < AppConstants.kPasswordRequiredLength {
            validInput = false
            
            self.showAlertViewWithTitle(AppConstants.kEmptyString, message: AppConstants.KValidationPassword, dismissCompletion: {
                self.passTextField.becomeFirstResponder()
            })
            
            
        }
        
        return validInput
    }
    @IBAction func btnSkip_Pressed(sender: AnyObject)
    {
//        let tabBarVc = self.storyboard?.instantiateViewControllerWithIdentifier("STTabbarController")
//        self.presentViewController(tabBarVc!, animated: true, completion: {
//            
//        })

         self.dismissViewControllerAnimated(true) { 
           print("Dismiss")
        }
        
    }
    
    // MARK:    -
    // MARK: TextField Delegate -
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
