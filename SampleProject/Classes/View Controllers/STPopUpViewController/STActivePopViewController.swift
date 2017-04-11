//
//  STActivePopViewController.swift
//  STREET
//
//  Created by Waris Shams on 14/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STActivePopViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCrossThePop_Pressed(sender: AnyObject)
    {
      self.dismissViewControllerAnimated(true, completion: {() -> Void in
        })

    }

}
