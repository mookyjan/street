//
//  STShopViewController.swift
//  SampleProject
//
//  Created by Waris Shams on 23/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STShopViewController: BaseViewController , UIPageViewControllerDelegate {

    
    var pageController:  UIPageViewController!
    var myViewControllers : NSArray? = []

    var nearShops: STNearByShopViewController?
    var favouriteShop: STFavouritesShopViewController?
    var categories: STCategoriesShopViewController?
    @IBOutlet weak var containerView: UIView!

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
    
    override func viewWillAppear(animated: Bool) {
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        
    }
    
    func setUpView()
    {
        self.view.layoutIfNeeded()
        self.setupNavigationBarTitle("SHOP", showRightButton: false, leftButtonType:.None, rightButtonType:.Tick)
        myViewControllers = [nearByShop(), favouriteShops(), categoriesOfProduct()]
        pageController.delegate = self
        
        pageController.setViewControllers([self.nearShops!], direction: .Forward, animated: true, completion: { _ in })
       
        containerView.addSubview(pageController.view)
        containerView.layoutIfNeeded()

//        containerView.addConstraint(NSLayoutConstraint(item: pageController.view, attribute: .Top, relatedBy: .Equal, toItem: containerView, attribute: .Top, multiplier: 1.0, constant: 0.0))
//        containerView.addConstraint(NSLayoutConstraint(item: pageController.view, attribute: .Bottom, relatedBy: .Equal, toItem: containerView, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
//        containerView.addConstraint(NSLayoutConstraint(item: pageController.view, attribute: .Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1.0, constant: 0.0))
//        containerView.addConstraint(NSLayoutConstraint(item: pageController.view, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1.0, constant: 0.0))
//        pageController.view.layoutIfNeeded()

        
    }
    
    func initializations()
    {
        pageController = UIPageViewController(transitionStyle: .PageCurl, navigationOrientation: .Horizontal, options: nil)

    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    func viewControllerAtIndex(index: Int) -> UIViewController {
        return myViewControllers![index] as! UIViewController
    }
    
    
    func nearByShop() -> STNearByShopViewController {
        if (nearShops == nil) {
            nearShops = self.storyboard!.instantiateViewControllerWithIdentifier("STNearByShopViewController") as? STNearByShopViewController
            
        }
        return nearShops!
    }
    

    func favouriteShops() -> STFavouritesShopViewController {
        if (favouriteShop == nil) {
            favouriteShop = self.storyboard!.instantiateViewControllerWithIdentifier("STFavouritesShopViewController") as? STFavouritesShopViewController
            
        }
        return favouriteShop!
    }

    func categoriesOfProduct() -> STCategoriesShopViewController {
        if (categories == nil) {
            categories = self.storyboard!.instantiateViewControllerWithIdentifier("STCategoriesShopViewController") as? STCategoriesShopViewController
            
        }
        return categories!
    }

    
    // MARK:
    // MARK : btnAction
    // MARK : -

    @IBAction func btnNearByPressed(sender: AnyObject)
    {
        let index = 0
        pageController.setViewControllers([self.viewControllerAtIndex(index)], direction: .Reverse, animated: false, completion: {(finished: Bool) -> Void in
        })

    }
    @IBAction func btnFavouriteShop_Pressed(sender: AnyObject)
    {
        let index = 1
        pageController.setViewControllers([self.viewControllerAtIndex(index)], direction: .Reverse, animated: false, completion: {(finished: Bool) -> Void in
        })
    }

    @IBAction func btnCategories_Pressed(sender: AnyObject)
    {
        let index = 2
        pageController.setViewControllers([self.viewControllerAtIndex(index)], direction: .Reverse, animated: false, completion: {(finished: Bool) -> Void in
        })
    }





}
