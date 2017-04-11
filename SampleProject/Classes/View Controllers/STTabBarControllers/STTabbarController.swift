//
//  STTabbarController.swift
//  SampleProject
//
//  Created by Waris Shams on 23/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STTabbarController: UITabBarController {

    let titleFontAll : UIFont = UIFont(name: "Helvetica Neue", size: 8.0)!
    

  
    override func viewDidLoad()
    {
        super.viewDidLoad()
     
        let attributesNormal = [
            NSFontAttributeName : titleFontAll
        ]
        
        let attributesSelected = [
            NSFontAttributeName : titleFontAll
        ]
        
        self.tabBar.items![0].selectedImage = UIImage(named:"street-s")!.imageWithRenderingMode(.AlwaysOriginal)
        (self.tabBar.items![0] ).image = UIImage(named:"street")!.imageWithRenderingMode(.AlwaysOriginal)
        
        self.tabBar.items![1].selectedImage = UIImage(named:"map-selected")!.imageWithRenderingMode(.AlwaysOriginal)
        (self.tabBar.items![1] ).image = UIImage(named:"map-unselected")!.imageWithRenderingMode(.AlwaysOriginal)
      
        self.tabBar.items![2].selectedImage = UIImage(named:"lets-meet-s")!.imageWithRenderingMode(.AlwaysOriginal)
        (self.tabBar.items![2] ).image = UIImage(named:"lets-meet")!.imageWithRenderingMode(.AlwaysOriginal)
        
        self.tabBar.items![3].selectedImage = UIImage(named:"checkin-s")!.imageWithRenderingMode(.AlwaysOriginal)
        (self.tabBar.items![3] ).image = UIImage(named:"checkin")!.imageWithRenderingMode(.AlwaysOriginal)
        
        self.tabBar.items![4].selectedImage = UIImage(named:"setting icon selected")!.imageWithRenderingMode(.AlwaysOriginal)
        (self.tabBar.items![4] ).image = UIImage(named:"setting icon")!.imageWithRenderingMode(.AlwaysOriginal)
        
        UITabBarItem.appearance().setTitleTextAttributes(attributesNormal, forState: .Normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributesSelected, forState: .Selected)

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
        // Dispose of any resources that can be recreated.
    
    }
   
    
    
 }


extension UITabBar {
    
    override public func sizeThatFits(size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 45
        return sizeThatFits
    }
}
