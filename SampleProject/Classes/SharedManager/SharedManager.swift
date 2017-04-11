//
//  SharedManager.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//
import Foundation
class SharedManager: NSObject {

    convenience override init() {
        self.init()
    }
    
    
    class var sharedInstance: SharedManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: SharedManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = SharedManager()
        }
        return Static.instance!
    }
    
    
}
