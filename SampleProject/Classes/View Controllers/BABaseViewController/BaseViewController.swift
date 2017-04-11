//
//  BaseViewController.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//
import Foundation
import UIKit
import MessageUI

enum UINavigationBarRightButtonType : Int {
    case None
    case Search
    case Tick
    case Done
    case Add
    case ADDFRIENDS
    case Share
}

enum UINavigationBarLeftButtonType : Int {
    case None
    case Back
    case Menu
    case Cross
}

protocol BaseViewControllerDelegate {
    func rightNavigationBarButtonClicked()
    func leftNavigationBarButtonClicked()
}
class BaseViewController: UIViewController {
    var baseDelegate: BaseViewControllerDelegate?
    var leftButton: UIButton?
    var rightButton: UIButton?
    var rightbtnItem: UIBarButtonItem?
    var leftbtnItem:  UIBarButtonItem?
    var leftbtnType:  UINavigationBarLeftButtonType?
    var rightbtnType: UINavigationBarRightButtonType?
//    var mySearchBar  : UISearchBar?

    
    
    func backViewController() -> UIViewController {
        let numberOfViewControllers: Int = self.navigationController!.viewControllers.count
        if numberOfViewControllers >= 2 {
            return self.navigationController!.viewControllers[numberOfViewControllers - 2]
        }
        return self.navigationController!.viewControllers[numberOfViewControllers-1]
    }

    func setupNavigationBarTitle(title: String, showRightButton: Bool, leftButtonType: UINavigationBarLeftButtonType, rightButtonType: UINavigationBarRightButtonType) {
        self.hideNavigationBar(false)
        self.leftbtnType = leftButtonType
        self.rightbtnType = rightButtonType
        if showRightButton {
            self.rightButton = UIButton.init(type: UIButtonType.Custom)
            if rightButtonType == .Done {
                self.rightButton!.frame = CGRectMake(0, 0, 100, 24)
                
                UtilityFunctions .setViewBorder(self.rightButton!, withWidth: 5, andColor: UIColor.whiteColor())
                self.rightButton?.cornerRadius =  3.0
                self.rightButton!.setTitle(rightButtonType == .Done ? "ADD FRIENDS" : "", forState: UIControlState.Normal)
                self.rightButton!.titleLabel!.font = UIConfiguration.getUIFONTBOLD(12)
                
                
                
            }
            else if rightButtonType == .None {
                self.navigationItem.rightBarButtonItem = nil
            }
            else
            {
                let optionsImage: UIImage! = ((rightButtonType == .Tick) ? UIImage(named: "check-sign"): (rightButtonType == .Add) ? UIImage(named: "add-icon") :(rightButtonType == .Search) ? UIImage(named: "search-icon") : (rightButtonType == .Share) ? UIImage(named: "share-white-icon") : nil )
                self.rightButton = UIButton(frame: CGRectMake(0, 0, 44, 44))
                self.rightButton?.setImage(optionsImage, forState: .Normal)
            }
            self.rightButton!.addTarget(self, action: #selector(BaseViewController.rightNavigationButtonClicked(_:)), forControlEvents: .TouchUpInside)
            self.rightButton?.contentMode = .ScaleAspectFit
            self.rightbtnItem = UIBarButtonItem(customView: rightButton!)
            
            let negativeSpacer: UIBarButtonItem? = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
            negativeSpacer?.width = ConstantDevices.IS_IOS_6 ? -6 : -8
        
            self.navigationItem.setRightBarButtonItems([negativeSpacer!, rightbtnItem!], animated: false)
        }
        
        else {
            self.rightButton?.hidden = true
        }
        if leftButtonType == .None {
            self.navigationItem.leftBarButtonItem = nil
//            self.navigationItem.setLeftBarButtonItems([], animated: false)
        }else{
        self.leftButton = UIButton.init(type: UIButtonType.Custom)
        let menuImage: UIImage? = ((leftButtonType == .Menu) ? UIImage(named: "check-sign") : (leftButtonType == .Back) ? UIImage(named: "back-icon") : (leftButtonType == .Cross) ? UIImage(named: "cross-button"): nil)
        //Get Images from UIConfiguration
        self.leftButton!.frame = CGRectMake(0, 0, 44, 44)
        self.leftButton!.addTarget(self, action: #selector(BaseViewController.leftNavigationButtonClicked(_:)), forControlEvents: .TouchUpInside)
        self.leftButton!.setImage(menuImage, forState: .Normal)
        self.leftbtnItem = UIBarButtonItem(customView: self.leftButton!)
        let negativeSpacer: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        negativeSpacer.width = ConstantDevices.IS_IOS_6 ? -6 : -16
        self.navigationItem.setLeftBarButtonItems([negativeSpacer, self.leftbtnItem!], animated: false)
        }
        if title != NSNull() {
            self.navigationItem.title = title
        }
    }

    func setupNavigationBarWithTitleImage(imageName: String, showBackButtonIfNeeded show: Bool) {
        self.hideNavigationBar(false)
        let barImageView: UIImageView = UIImageView(image: UIImage(named: "check-sign"))
        self.navigationItem.titleView = barImageView
        self.showBackButtonIfNeeded(show)
    }

    func changeButtonColor(color: UIColor) {
        self.leftButton!.backgroundColor = color
    }

    func hideStatusBar(hide: Bool) {
        UIApplication.sharedApplication().setStatusBarHidden(hide, withAnimation: .None)
    }

    func hideNavigationBar(hide: Bool) {
        self.navigationController!.navigationBarHidden = hide
    }
    
    func goBackToIndex(backIndex: Int) {
        self.goBackToIndex(backIndex, animated: true)
    }

    func goBackToIndex(backIndex: Int, animated animate: Bool) {
        if (self.navigationController!.viewControllers.count - backIndex) > 0 {
            let controller: BaseViewController = (self.navigationController!.viewControllers[(self.navigationController!.viewControllers.count - 1 - backIndex)] as! BaseViewController)
            self.navigationController!.popToViewController(controller, animated: animate)
        }
    }
    
    func logoutToLoginViewController() {
        self.navigationController!.popToRootViewControllerAnimated(true)
        //    [UtilityFunctions setValueInUserDefaults:@(NO) forKey:@"user"];
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.interactivePopGestureRecognizer!.delegate = nil
}

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.baseDelegate = nil
    }
    // 

    func rightNavigationButtonClicked(sender: AnyObject) {
        NSLog("Right Navigation Button Clicked")
        self.baseDelegate?.rightNavigationBarButtonClicked()
    }

    func leftNavigationButtonClicked(sender: AnyObject) {
        NSLog("Left Navigation Button Clicked")
        self.baseDelegate?.leftNavigationBarButtonClicked()
    }

    func btnMenuClicked() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func showBackButtonIfNeeded(show: Bool) {
        if show {
            let backBarImage: UIImage = (self.navigationController!.viewControllers.count > 1 ? UIConfiguration.NavBarBackImage : UIConfiguration.NavBarMenuImage)!
            self.leftButton = UIButton(frame: CGRectMake(0, 0, backBarImage.size.width, backBarImage.size.height))
            self.leftButton!.addTarget(self, action: "leftNavigationButtonClicked:", forControlEvents: .TouchUpInside)
            self.leftButton!.setImage(backBarImage, forState: .Normal)
            let backbtnItem: UIBarButtonItem = UIBarButtonItem(customView: self.leftButton!)
            self.navigationItem.leftBarButtonItem = backbtnItem
        }
    }
    
    }