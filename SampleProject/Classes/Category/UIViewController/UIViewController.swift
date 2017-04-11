//
//  UIViewController.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 11/03/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation

extension UIViewController {
    
    // MARK: - UIAlertController
    
    typealias AlertViewDismissHandler = () -> Void
    typealias AlertViewCurrentPasswordConfirmedHandler = (String) -> Void
    
    func showAlertViewWithTitle(title:String,message : String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func showAlertViewWithTitle(title:String,message : String, dismissCompletion:(AlertViewDismissHandler))
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action -> Void in
            //Do some other stuff
             dismissCompletion()
            }))
        presentViewController(alertController, animated: true, completion:nil)
    }
    
    func showConfirmationAlertViewWithTitle(title:String,message : String, dismissCompletion:(AlertViewDismissHandler))
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "YES", style: .Default, handler: { action -> Void in
            //Do some other stuff
            dismissCompletion()
        }))
        
        alertController.addAction(UIAlertAction(title: "NO", style: .Cancel, handler: { action -> Void in
            //Do some other stuff
            
        }))
        
        presentViewController(alertController, animated: true, completion:nil)
    }
    
    func showCurrentPasswordConfirmationAlertViewWithTitle(title:String,message : String, dismissCompletion:(AlertViewCurrentPasswordConfirmedHandler))
    {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            dismissCompletion("")
        }
        alertController.addAction(cancelAction)

        let nextAction: UIAlertAction = UIAlertAction(title: "Next", style: .Default) { action -> Void in
            let textField:UITextField = (alertController.textFields?.first)!
            dismissCompletion(textField.text!)
            
        }
        alertController.addAction(nextAction)
        alertController.addTextFieldWithConfigurationHandler { textField -> Void in
            textField.placeholder = "Current Password"
            textField.secureTextEntry = true
            textField.textColor = UIColor.blueColor()
            textField.addTarget(self, action: "alertTextFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        }
        presentViewController(alertController, animated: true, completion:nil)

    }
    private func alertTextFieldDidChange(textField:UITextField) -> Void {
        let presentedAlertController:UIAlertController! = self.presentedViewController! as! UIAlertController
        let textField:UITextField! = presentedAlertController.textFields?.first
        let okAction:UIAlertAction! = presentedAlertController.actions.last
        okAction.enabled = textField.text?.length>2
        
    }
    
    func showTextInputAlertViewWithTitle(title:String,message : String, dismissCompletion:(AlertViewCurrentPasswordConfirmedHandler))
    {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            dismissCompletion("")
        }
        alertController.addAction(cancelAction)
        
        let nextAction: UIAlertAction = UIAlertAction(title: "Next", style: .Default) { action -> Void in
            let textField:UITextField = (alertController.textFields?.first)!
            dismissCompletion(textField.text!)
            
        }
        alertController.addAction(nextAction)
        alertController.addTextFieldWithConfigurationHandler { textField -> Void in
            textField.placeholder = "Enter something"
            textField.textColor = UIColor.blackColor()
        }
        presentViewController(alertController, animated: true, completion:nil)
        
    }
    
}