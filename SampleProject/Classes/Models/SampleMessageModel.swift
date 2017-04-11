//
//  SampleMessageModel.swift
//  SwiftSample
//
//  Created by Waris Shams on 05/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

//import UIKit
//
//class SampleMessageModel: NSObject {
//
//    var message_type : String
//    var id : Int
//    var body : String
//    var sender_id: String
//    var receiver_id :String
//    
//    init(messageType: String, id: Int, body : String, sender_id: String, receiver_id :String) {
//        self.message_type   = messageType
//        self.id             = id
//        self.body           = body
//        self.sender_id      = sender_id
//        self.receiver_id    = receiver_id
//    }
//    
//    class func getModelObjectWithDictionary(dictionary : NSDictionary) -> ZWMessageModel{
//        let message_type = dictionary.objectForKey("message_type") as! String
//        let id = dictionary.objectForKey("id") as! Int
//        let body = dictionary.objectForKey("body") as! String
//        let sender_id = dictionary.objectForKey("sender_id") as! String
//        let receiver_id = dictionary.objectForKey("receiver_id") as! String
//        
//        let modelObject = SampleMessageModel.init(messageType: message_type, id: id, body: body, sender_id: sender_id, receiver_id: receiver_id)
//        return modelObject
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        // super.init(coder:) is optional, see notes below
//        self.message_type = aDecoder.decodeObjectForKey("message_type") as! String
//        self.id = aDecoder.decodeIntegerForKey("id")
//        self.body = aDecoder.decodeObjectForKey("body") as! String
//        self.sender_id = aDecoder.decodeObjectForKey("sender_id") as! String
//        self.receiver_id = aDecoder.decodeObjectForKey("receiver_id") as! String
//    }
//    
//    func encodeWithCoder(aCoder: NSCoder) {
//        // super.encodeWithCoder(aCoder) is optional, see notes below
//        aCoder.encodeObject(self.message_type, forKey: "message_type")
//        aCoder.encodeObject(self.body, forKey: "body")
//        aCoder.encodeObject(self.sender_id, forKey: "sender_id")
//        aCoder.encodeObject(self.receiver_id, forKey: "receiver_id")
//        aCoder.encodeInteger(self.id, forKey: "anInt")
//        
//    }
//    
//    // Provide some debug info
//    override var description: String {
//        get {
//            return ("\(self.message_type), \(self.body), \(self.sender_id), \(self.receiver_id), \(self.id)")
//        }
//    }
//    
//}
