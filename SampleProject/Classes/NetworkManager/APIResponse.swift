//
//  APIResponse.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//
//
import Foundation
class APIResponse: NSObject {
    var error: Error?
    var optionalMessage: String = ""
    var data: AnyObject?

    override init() {
        
    }
    /*
    https://medium.com/swift-programming/swift-typealias-to-the-rescue-b1027fc571e3#.fc5o4ma70
    typealias SuccessHandler = dictResponse: [NSObject : AnyObject], error networkError: NSError) -> APIResponse
    typealias ErrorHandler = (error: NSError, operation: AFHTTPRequestOperation)
    -> Void
    typealias FinishedHandler = () -> Void
    */
    
    class func handleResponse(dictResponse: [NSObject : AnyObject], error networkError: NSError) -> APIResponse {
        let response: APIResponse = APIResponse()
        if networkError != NSNull() {
            var result: [NSObject : AnyObject] = dictResponse
            if CInt((result["status"] as! String))! == 0 {
                response.error = Error(dictResult: result)
                response.data = NSNull()
            }
            else {
                if let jsonResult = result as? Dictionary<String, AnyObject> {
                    response.optionalMessage = jsonResult["message"] as! String
                    response.data = (dictResponse["result"] as! String)
                }
            }
        }
        else {
            response.error = Error(error: networkError)
            response.data = NSNull()
        }
        return response
    }
}
