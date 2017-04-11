//
//  UtilityHelper.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 01/03/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation
import UIKit

/**
 A wrapper around GCD queues. This shouldn't be accessed directly, but rather through
 the helper functions supplied by the APSwiftHelpers package.
 */
public enum QueueType {
    case Main
    case Background
    case LowPriority
    case HighPriority
    
    var queue: dispatch_queue_t {
        switch self {
        case .Main:
            return dispatch_get_main_queue()
        case .Background:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        case .LowPriority:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
        case .HighPriority:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
        }
    }
}

class UtilityHelper
{
    // MARK: - UIAlertViewController (called from UIViewController)
    
    /**
    * Usage: Helpers.showOKAlert("Alert", message: "Something happened", target: self)
    */
    static func showOKAlert(title: String, message: String, target: UIViewController)
    {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        target.presentViewController(alertController, animated: true, completion: nil)
    }
    
    /**
     * Usage: Helpers.showOKHelpAlert("Notice", message: "Something happened.", target: self, handler: { (UIAlertAction) -> Void in
     *          // perform help option code here
     *     })
     */
    static func showOKHelpAlert(title: String, message: String, target: UIViewController, handler: ((UIAlertAction) -> Void)?)
    {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let helpAction: UIAlertAction = UIAlertAction(title: "Help", style: .Default, handler: handler)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(helpAction)
        alertController.addAction(okAction)
        target.presentViewController(alertController, animated: true, completion: nil)
    }
    
    /**
     * Usage: Helpers.showContinueAlert("Log Out", message: "Are you sure you want to log out?", target: self, handler: { (UIAlertAction) -> Void in
     *          // perform log out code here
     *     })
     */
    static func showContinueAlert(title: String, message: String, target: UIViewController, handler: ((UIAlertAction) -> Void)?)
    {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let continueAction: UIAlertAction = UIAlertAction(title: "Continue", style: .Default, handler: handler)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(continueAction)
        target.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // MARK: - UIActionSheet (TODO)
    
    // MARK: - Localization
    
    static func getFormattedStringFromNumber(number: Double) -> String
    {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .DecimalStyle
        return numberFormatter.stringFromNumber(number)!
    }
    
    static func getFormattedStringFromDate(aDate: NSDate) -> String
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        return dateFormatter.stringFromDate(aDate)
    }
    
    // MARK: - Set Up Application UI Appearance
    class func setupApplicationUIAppearance() {
        UILabel.appearance().setSubstituteFontName(UIConfiguration.UIFONTAPP)
        let titleTextAttributeTabBarItem:[String:AnyObject] = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIConfiguration.getUIFONTAPPREGULAR(17)
        ]
        UITabBarItem.appearance().setTitleTextAttributes(titleTextAttributeTabBarItem, forState: UIControlState.Normal)
        
        let titleTextAttributeBarButtonItem:[String:AnyObject] = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIConfiguration.getUIFONTAPPREGULAR(16)
        ]
        if #available(iOS 9.0, *) {
            UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).setTitleTextAttributes(titleTextAttributeBarButtonItem, forState: UIControlState.Normal)
        } else {
            // Fallback on earlier versions
        }
        
        let rect:CGRect! = CGRectMake(0 ,0, UIScreen.mainScreen().bounds.width, 64)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, UIConfiguration.MainBackColor.CGColor)
        CGContextFillRect(context, rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UINavigationBar.appearance().setBackgroundImage(image, forBarMetrics: UIBarMetrics.Default)
        
    }
    // MARK: - Validations
    
    class func isValidEmailAddress(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    class func isValidateNumber(checkString: NSString) -> Bool {
        let numcharacters: NSCharacterSet = NSCharacterSet(charactersInString: Constants.getValidate_Numeric())
        var characterCount: Int32 = 0
        var i: Int
        for i = 0 ; i < checkString.length ; i += 1 {
            let character: unichar = checkString.characterAtIndex(i)
            if !numcharacters.characterIsMember(character) {
                characterCount += 1
            }
        }
        if characterCount == 0 {
            return true
        } else {
            return false
            
        }
    }
    
    class func isValidateSaudiaNumber(checkString: NSString) -> Bool {
        //+966126123100
        //http://regexlib.com/Search.aspx?k=saudi&c=-1&m=-1&ps=20
        //https://gist.github.com/homaily/8672499
        //https://regex101.com
        let numcharacters: NSCharacterSet = NSCharacterSet(charactersInString: "^(009665|9665|+9665|05|+966)(5|0|3|6|4|9|1|8|7|2)([0-9]{7})")
        var characterCount: Int32 = 0
        var i: Int
        for i = 0 ; i < checkString.length ; i += 1 {
            let character: unichar = checkString.characterAtIndex(i)
            if !numcharacters.characterIsMember(character) {
                characterCount += 1
            }
        }
        if characterCount == 0 {
            return true
        } else {
            return false
            
        }
    }
    
    class func isValidateAlphabet(checkString: NSString) -> Bool {
        let numcharacters: NSCharacterSet = NSCharacterSet(charactersInString: " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var characterCount: Int32 = 0
        var i: Int
        for i = 0 ; i < checkString.length ; i += 1 {
            let character: unichar = checkString.characterAtIndex(i)
            if !numcharacters.characterIsMember(character) {
                characterCount += 1
            }
        }
        if characterCount == 0 {
            return true
        } else {
            return false
            
        }
    }
    
    class func isValidateAlphabetWithWhiteSpace(checkString: NSString) -> Bool {
        let numcharacters: NSCharacterSet = NSCharacterSet(charactersInString: " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
        var characterCount: Int32 = 0
        var i: Int
        for i = 0 ; i < checkString.length ; i += 1 {
            let character: unichar = checkString.characterAtIndex(i)
            if !numcharacters.characterIsMember(character) {
                characterCount += 1
            }
        }
        if characterCount == 0 {
            return true
        } else {
            return false
            
        }
    }
    
    class func isValidStringNumericPlus(checkString: NSString) -> Bool {
        let numcharacters: NSCharacterSet = NSCharacterSet(charactersInString: "0123456789+")
        var characterCount: Int32 = 0
        var i: Int
        for i = 0 ; i < checkString.length ; i += 1 {
            let character: unichar = checkString.characterAtIndex(i)
            if !numcharacters.characterIsMember(character) {
                characterCount += 1
            }
        }
        if characterCount == 0 {
            return true
        } else {
            return false
            
        }
    }
    
    // MARK: - Get Preferred Language
    
    class func getPrefferedLanguage() -> String {
        for languageItem in NSLocale.preferredLanguages() {
            if languageItem == "en" || languageItem == "ru" || languageItem == "uk" || languageItem == "de" || languageItem == "fr" || languageItem == "it" || languageItem == "es" || languageItem == "ar" {
                return languageItem
            }
        }
        return "en"
    }
    // MARK: - Dynamic Heights
    
    class func getTextDymanicHeightOfStringWithText(text: NSString, andFont font: UIFont, andFrame frame: CGRect) -> CGFloat {
        let maxSize: CGSize = CGSizeMake(frame.size.width, 999999.0)
        var height: CGFloat = 0
        
        let frame1: CGRect = text.boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        height = frame1.size.height
        return height+5
    }
    
    class func getLabelDymanicHeight(label: UILabel) -> CGFloat {
        let maxSize: CGSize = CGSizeMake(label.frame.size.width, 999999.0)
        var height: CGFloat = 0
        let font: UIFont = label.font
        
        let frame: CGRect = label.text!.boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        height = frame.size.height
        label.numberOfLines = 0
        return height+5
    }
    
    class func getStringHeightWithConstrainedWidth(text: String, width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        
        let boundingBox = text.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    class func getAttributedStringHeightWithConstrainedWidth(attributedText: NSAttributedString, width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        let boundingBox = attributedText.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
    
    class func getAttributedStringWidthWithConstrainedHeight(attributedText: NSAttributedString, height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.max, height: height)
        
        let boundingBox = attributedText.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.width)
    }
    
    // MARK: - Date Conversions
    
    class func convertStringDate(date: String, formatFrom: String, formatTo: String) -> String {
        let dateString: String = date
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        // this is imporant - we set our input date format to match our input string
        // if format doesn't match you'll get nil from your string, so be careful
        dateFormatter.dateFormat = formatFrom
        var dateFromString: NSDate
        dateFromString = dateFormatter.dateFromString(dateString)!
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = formatTo
        //Optionally for time zone converstions
        formatter.timeZone = NSTimeZone(name: "...")
        let birthday: String = formatter.stringFromDate(dateFromString)
        return birthday
    }
    
    class func convertDateToString(date: NSDate, withFormat Format: String) -> String {
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = Format
        let stringFromDate: String = formatter.stringFromDate(date)
        return stringFromDate
    }
    
    class func convertStringToDate(date: String, formatFrom: String) -> NSDate {
        let myFormatter: NSDateFormatter = NSDateFormatter()
        myFormatter.timeZone = NSTimeZone.systemTimeZone()
        //    [myFormatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:@"Gregorion"]];
        myFormatter.dateFormat = formatFrom
        let myDate: NSDate = myFormatter.dateFromString(date)!
        return myDate
    }
    
    // MARK: - UIView Related
    
    class func setViewBorder(yourView: UIView, withWidth borderWidth: CGFloat, andColor borderColor: UIColor, cornerRadius radius: CGFloat, andShadowColor shadowColor: UIColor, shadowRadius: CGFloat) {
        // border radius
        yourView.layer.cornerRadius = radius
        // border
        yourView.layer.borderColor = borderColor.CGColor
        yourView.layer.borderWidth = borderWidth
        // drop shadow
        yourView.layer.shadowColor = shadowColor.CGColor
        yourView.layer.shadowOpacity = 0.8
        yourView.layer.shadowRadius = shadowRadius
        yourView.layer.shadowOffset = CGSizeMake(2.0, 2.0)
    }
    
    class func setViewBorder(view: UIView, withWidth width: CGFloat, andColor color: UIColor) {
        view.layer.borderColor = color.CGColor
        view.layer.borderWidth = 1
    }
    
    class func setViewCornerRadius(view: UIView, radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
    
    class func setViewBorderBottom(view: UIView, withWidth width: CGFloat, andColor color: UIColor) {
        view.layoutIfNeeded()
        let bottomBorder: CALayer = CALayer.init()
        bottomBorder.frame = CGRectMake(0.0, view.frame.size.height-0.5, view.frame.size.width, 0.5)
        bottomBorder.backgroundColor = color.CGColor
        view.layer.addSublayer(bottomBorder)
        view.clipsToBounds = true
    }
    
    class func setViewBorderBottom(view: UIView, withWidth width: CGFloat, atDistanceFromBottom bottonY: CGFloat, andColor color: UIColor, clipToBounds: Bool) {
        view.layoutIfNeeded()
        let bottomBorder: CALayer = CALayer.init()
        /*
        UIView *bottomBorder = [[UIView alloc] initWithFrame:CGRectMake(0.0f, view.frame.size.height-bottonY, view.frame.size.width, width)];
        bottomBorder.backgroundColor = color;
        [view addSubview:bottomBorder];
        */
        bottomBorder.frame = CGRectMake(0.0, view.frame.size.height-bottonY, view.frame.size.width, width)
        bottomBorder.backgroundColor = color.CGColor
        view.layer.addSublayer(bottomBorder)
        view.clipsToBounds = clipToBounds
    }
    
    class func setDropShadowOnView(view: UIView, shadowOffset: CGSize) {
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowColor = UIColor.darkGrayColor().CGColor
        view.layer.shadowRadius = 5.0
        view.layer.shadowOpacity = 0.7
        let shadowPath: CGPathRef = UIBezierPath(rect: view.layer.bounds).CGPath
        view.layer.shadowPath = shadowPath
    }
    
    class func setDropShadowOnTextField(view: UITextField, shadowOffset: CGSize) {
        view.borderStyle = UITextBorderStyle.None
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        view.layer.shadowOpacity = 0.5
        view.layer.backgroundColor = UIColor.whiteColor().CGColor
        view.layer.cornerRadius = 4
        let shadowPath: UIBezierPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: 3)
        view.layer.shadowPath = shadowPath.CGPath
    }
    // MARK: - Application Badge
    
    class func setApplicationBadgeNumber(number: Int) {
        UIApplication.sharedApplication().applicationIconBadgeNumber = number
    }
    
    class func increaseApplicationBadgeNumberByOne() {
        let count: Int = UIApplication.sharedApplication().applicationIconBadgeNumber
        UIApplication.sharedApplication().applicationIconBadgeNumber = count+1
    }
    
    // MARK: -
    // MARK: Session Save
    // MARK: -
    
    class func saveSessionToDisk(Session: NSDictionary) {
        let dictionary: NSMutableDictionary = NSMutableDictionary(dictionary: Session)
        let archiveData: NSData = NSKeyedArchiver.archivedDataWithRootObject(dictionary)
        var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDir: NSString = paths[0] as! String
        let fullPath: NSString = documentsDir.stringByAppendingPathComponent("SavedSession.plist")
        archiveData.writeToFile(fullPath as String, atomically: true)
    }
    
    class func loadSessionFromDisk() -> NSDictionary? {
        var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDir: NSString = paths[0] as! NSString
        let fullPath: String = documentsDir.stringByAppendingPathComponent("SavedSession.plist")
        print("\(fullPath)")
        let fileManager: NSFileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(fullPath) {
            var dict: NSDictionary? = nil
            let archiveData: NSData = NSData(contentsOfFile: fullPath)!
            dict = (NSKeyedUnarchiver.unarchiveObjectWithData(archiveData) as? NSMutableDictionary)
            return dict
        }
        return nil
    }
    
    // MARK: - Key Window
    class func getKeyWindow() -> UIWindow? {
        return UIApplication.sharedApplication().keyWindow
    }
    
    class func getAppWindow() -> UIWindow? {
        let ad  = UIApplication.sharedApplication().delegate as! AppDelegate
        return ad.window
    }
    
    // MARK: - Array Form / Dictionary Form
    
    /*
    class MyClass {
    var property1 = 1
    var property2 = "Hi"
    }
    ArrayForm((0, 1, 2, 3))                 // [0, 1, 2, 3]
    ArrayForm(MyClass())                    // [1, "Hi"]
    */
    
    class func ArrayForm(value: Any) -> [Any] {
        var mirror: Mirror? = Mirror(reflecting: value)
        var propertyValues = [Any]()
        
        while let currentMirror = mirror {
            propertyValues += currentMirror.children.map { $0.value }
            
            // Get superclass if it exists
            mirror = currentMirror.superclassMirror()
        }
        
        return propertyValues
    }
    
    
    /*
    class MyClass {
    var property1 = 1
    var property2 = "Hi"
    }
    DictionaryForm(MyClass())               // ["property1" : 1, "property2" : "Hi"]
    */
    
    class func DictionaryForm(value: Any) -> [String : Any] {
        var mirror: Mirror? = Mirror(reflecting: value)
        var objectDictionary = [String : Any]()
        
        while let currentMirror = mirror {
            for (propertyName, value) in currentMirror.children {
                if let key = propertyName { objectDictionary[key] = value }
            }
            
            // Get superclass if it exists
            mirror = currentMirror.superclassMirror()
        }
        
        return objectDictionary
    }
    
    // MARK: - Measure height/width from String
    class func measureWidthForText(text:NSString?,font:UIFont)->CGFloat{
        if text != nil{
            let tmpLabel = UILabel(frame: CGRectZero)
            tmpLabel.font = font
            tmpLabel.text = text as String!
            let size = tmpLabel.intrinsicContentSize().width
            return size
        }
        return 0
    }
    
    class func measureHeightForText(text:String,font:UIFont)->CGFloat{
        let tmpLabel = UILabel(frame: CGRectZero)
        tmpLabel.font = font
        tmpLabel.text = text as String
        let size = tmpLabel.intrinsicContentSize().height
        return size
    }
    
    class func requiredHeightForLabelWith(width:CGFloat, font:UIFont, text:String) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
//    class func maxFontSizeForLabel(text:String,labelWidth:CGFloat,labelHeight:CGFloat, font:UIFont)->CGFloat{
//        var fontSize = font.pointSize
//        var currentHeight = requiredHeightForLabelWith(labelWidth, font: font, text: text)
//        while currentHeight >= labelHeight{
//            fontSize = fontSize - 1
//            font = font.fontWithSize(fontSize)
//            currentHeight = requiredHeightForLabelWith(labelWidth, font: font, text: text)
//        }
//        return fontSize
//    }
    
    // MARK: - GCD 
    /**
    Perform a block on the specified queue. This is just a nicer wrapper around the dispatch_async()
    Grand Central Dispatch function.
    - Parameter queueType:  The queue to execute the block on
    - Parameter closure:    The block to execute
    *Example usage:*
    ```
    performOn(.Main) { self.tableView.reloadData() }
    ```
    */
    class func performOn(queueType: QueueType, closure: () -> Void) {
        dispatch_async(queueType.queue, closure)
    }
    
    /**
     Perform a block on a queue after waiting the specified time.
     - Parameter delay:     Time to wait in seconds before performing the block
     - Parameter queueType: Queue to execute the block on (default is the main queue)
     - Parameter closure:   Block to execute after the time specified in delay has passed
     *Example usage:*
     ```
     // Wait for 200ms then run the block on the main queue
     delay(0.2) { alert.hide() }
     // Wait for 1s then run the block on a background queue
     delay(1.0, queueType: .Background) { alert.hide() }
     ```
     */
    class func delay(delay: NSTimeInterval, queueType: QueueType = .Main, closure: () -> Void) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(time, queueType.queue, closure)
    }
    
    
    // MARK: - Mail
    /**
    Open Mail app Compose view
    
    - parameter email:   an email address
    - parameter subject: a subject
    - parameter body:    a body
    */
    class func openMailApp(email:String, subject:String, body:String) {
        let toEmail = email
        let toSubject = subject
        let toBody = body
        
        if let
            urlString = ("mailto:\(toEmail)?subject=\(toSubject)&body=\(toBody)").stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()),
            url = NSURL(string:urlString) {
                UIApplication.sharedApplication().openURL(url)
        }
    }
    
}