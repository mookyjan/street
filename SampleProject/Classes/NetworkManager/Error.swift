//
//  SportsAppError.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//
import Foundation
class Error: NSObject {
    var errorCode: String = ""
    var message: String = ""

    convenience init(dictResult: [NSObject : AnyObject]) {
        self.init()
        self.message = (dictResult["error"] as! String)
            if self.message == NSNull() {
                self.message = (dictResult["message"] as! String)
            }
    }

    convenience init(error: NSError) {
        self.init()
        //self.errorCode = [NSString stringWithFormat:@"%d",[error code]];
            self.message = error.localizedDescription
    }

    convenience init(message: String, errorCode code: String) {
        self.init()
        //self.errorCode = code;
            self.message = message
    }

    /**
     ** Initialize Error with @dictResult dictionary
     ** @dictResult is the dictionary that contains error-code and related error-messages.
     **/
    /**
     ** Initialize with @error
     **/
    /**
     ** Initialize with @message & @errorCode
     **/
    /**
     ** Describe the error
     ** Used in log statements
     **/

//    func description() -> String {
//        return self.message
//    }
}