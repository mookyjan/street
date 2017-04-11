//
//  UserManager.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//
//#import "MOLoggedUser.h"
//#define NO_USER_MANAGER


import Foundation
public class UserManager {
    
    static let kUserType: String = "user"
    
    static let UserManagerUserToken: String = "UserManagerUserToken"
    
    static var _currentUser: MOUser?
    
    static var _token: String?
    
    class public var token:String {
        get {
            return NSUserDefaults.standardUserDefaults().stringForKey(UserManager.UserManagerUserToken)!
        }
        set {
            UserManager.setToken(token)
        }
    }
    
    
    class public var currentUser: MOUser? {
        set {
            UserManager.setCurrentUser(currentUser)
        }
        get {
            if (_currentUser != nil) {
                return _currentUser!
            }
            let dataCurentUser: NSData! = NSData(contentsOfFile: UserManager.pathWithObjectType(UserManager.kUserType))
            if (dataCurentUser != nil) {
                _currentUser = NSKeyedUnarchiver.unarchiveObjectWithData(dataCurentUser) as? MOUser
                //DLog(@"\n\n\nCurrent user Auth-token: - %@", currentUser.api_token);
                return _currentUser!
            }
            return _currentUser
        }
    }
    
    
    init() {
        
    }
    
    // MARK: - User
    
    
    class public func setCurrentUser(newCurrentUser: MOUser?) {
        assert(newCurrentUser != nil, "Trying to set current user to nil! Use [UserManager logOutCurrentUser] instead!")
        _currentUser = newCurrentUser
        UserManager.saveCurrentUser()
    }
    
    class internal func saveCurrentUser() {
        if _currentUser == nil {
            assert(_currentUser != nil, "Error! Save current user: currentUser == nil!!")
            return
        }
        let path: String = UserManager.pathWithObjectType(UserManager.kUserType)
        let filemgr : NSFileManager = NSFileManager.defaultManager()
        
        print ("PATH : \n%@", path)
        do {
            try filemgr.removeItemAtPath(path as String)
            if filemgr.fileExistsAtPath(path) {
                print("Deleting previous user entry")
            }
        }
        catch {
            print ("Failed to Delete logged user")
        }
        
        let userData: NSData = NSKeyedArchiver.archivedDataWithRootObject(_currentUser!)
        
//        let file: NSFileHandle? = NSFileHandle(forUpdatingAtPath: path)
        
//        if file == nil {
//            print("File open failed")
//        } else {
//            file?.seekToFileOffset(10)
//            file?.writeData(userData)
//            file?.closeFile()
//        }
//        
        
        if filemgr.isWritableFileAtPath(path) {
            print("File is writable")
            do {
                try userData.writeToFile(path, options: .AtomicWrite)
            } catch {
                print("File Cannot be written")
            }
        } else {
            print("File is read-only")
        }
        
//        assert(error == nil, "currentUser save Error:"+ error!.localizedDescription)
        
    }
    
    class public func logOutCurrentUser() {
        let path:String = UserManager.pathWithObjectType(UserManager.kUserType)
        do {
            try NSFileManager.defaultManager().removeItemAtPath(path)
            if NSFileManager.defaultManager().fileExistsAtPath(path) {
                print("Deleting previous user entry")
            }
        }
        catch {
            print("Failed to Delete user File")
        }
        UserManager.setCurrentUser(nil)
    }
    
    class public func logOutUserAndClearToken() {
        UserManager.logOutCurrentUser()
        UserManager.setCurrentUser(nil)
        UserManager.setToken("")
    }
    
  class public func isLoggedIn() -> Bool {
        return _currentUser != nil && _token?.length>0
    }
    
    
  class internal func setToken(token: String) {
    _token = token
        if _token != nil {
            NSUserDefaults.standardUserDefaults().setObject(_token, forKey: UserManagerUserToken)
        } else {
            NSUserDefaults.standardUserDefaults().removeObjectForKey(UserManagerUserToken)
            
        }
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    // MARK: - Utility
    class internal func pathWithObjectType(objectType: String) -> String {
        
        let fileManager = NSFileManager.defaultManager()
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        if let documentDirectory: NSURL = urls.first! as NSURL {
            // This is where the database should be in the documents directory
            let finalDatabaseURL = documentDirectory.URLByAppendingPathComponent("\(objectType).bin")
            return finalDatabaseURL.absoluteString
        }
        return ""
//        return "\(NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] )"+"\(objectType).bin"
    }
    
}