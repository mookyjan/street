//
//  STFollowUnFollowViewController.swift
//  STREET
//
//  Created by Ahmad on 05/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit
import Alamofire

class STFollowUnFollowViewController: BaseViewController {

   
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
    }
    
    func initializations()
    {
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    
//    https://nutonia.herokuapp.com/api/v1/users/1/follow

// func followThisPerson()
// {
//    let dict =
//        [
//            "email"    : "ahmad@gmail.com",
//            "follow_id" : "3" ,
//            ]
//    let params = ["user":dict]
//    SVProgressHUD.show()
//    Alamofire.request(.PUT, AppConstants.kAPIBaseURL + AppConstants.KAPIUserUrl + (UserManager._currentUser?.userID)! + AppConstants.kAPIFollow , parameters: params, encoding:  .JSON)
//        .validate()
//        .responseJSON { [weak self] response in
//            
//            SVProgressHUD.dismiss()
//            print(AppConstants.kAPIBaseURL + AppConstants.KAPIUserUrl + (UserManager._currentUser?.userID)! + AppConstants.kAPIFollow)
//            switch response.result {
//            case .Success(let responseContent):
//                print(response.result)
//                print(responseContent)
//                
//                let arrayOfResult = responseContent["results"] as! NSDictionary
//                let userfollow: MOFollowAndUnFollow?
//                userfollow = MOFollowAndUnFollow.init(object: arrayOfResult)
//
//                
//                
//                let  value =  responseContent["status"]
//                
//               break
//            case .Failure(let error):
//                
//                [self?.showAlertViewWithTitle(AppConstants.kEmptyString, message: "Failure")]
//                
//                print(error)
//                break
//            }
//    }
//    }

 }




