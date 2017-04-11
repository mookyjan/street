//
//  MOAllUser.swift
//  STREET
//
//  Created by Ahmad on 05/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

public class MOAllUser: NSObject  , NSCoding {
    
    internal let KMOUser_ID: String = "id"
    internal let kMOUserNames: String = "name"
    internal let kMOEmail: String = "email"
    internal let KMOPhoneNumber: String = "phone"
    internal let KMOCreate: String = "created_at"
    internal let KMOUpdateAt :String = "updated_at"
    internal let KMOCurrency_id: String = "currency_id"
    internal let KMOProfilePic: String = "profile_picture"
    internal let KMOCity: String = "city"
    
    
    // MARK: Properties
    public var userId: String!
    public var uerPhoneNumber: String!
    public var userCity: String!
    public var emailOfUser: String!
    public var userNames : String!
    public var userCreatedAt: String!
    public var userCurrencyId: String!
    public var userUpdatedAt: String!
    public var userAppPin: String!
    public var userProfilePicture: String!
    
    
    convenience public init(object: AnyObject) {
        self.init(dictionary: (object as? [String : AnyObject])!)
    }
    
    
    public init(dictionary: [String:AnyObject]) {
        
        userId = dictionary[KMOUser_ID] as? String
        uerPhoneNumber = dictionary[KMOPhoneNumber] as? String
        userCity = dictionary[KMOCity] as? String
        emailOfUser = dictionary[kMOEmail] as? String
        userNames = dictionary[kMOUserNames] as? String
        userCreatedAt = dictionary[KMOCreate] as? String
        userCurrencyId = dictionary[KMOCurrency_id] as? String
        userUpdatedAt = dictionary[KMOUpdateAt] as? String
        userProfilePicture = dictionary[KMOProfilePic] as? String
        
    }
    
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.userId = aDecoder.decodeObjectForKey(KMOUser_ID) as? String
        self.uerPhoneNumber = aDecoder.decodeObjectForKey(KMOPhoneNumber) as? String
        self.userCity = aDecoder.decodeObjectForKey(KMOCity) as? String
        self.emailOfUser = aDecoder.decodeObjectForKey(kMOEmail) as? String
        self.userNames = aDecoder.decodeObjectForKey(kMOUserNames) as? String
        self.userCreatedAt = aDecoder.decodeObjectForKey(KMOCreate) as? String
        self.userCurrencyId = aDecoder.decodeObjectForKey(KMOCurrency_id) as? String
        self.userUpdatedAt = aDecoder.decodeObjectForKey(KMOUpdateAt) as? String
        self.userProfilePicture = aDecoder.decodeObjectForKey(KMOProfilePic) as? String
        
    }
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(userId, forKey: KMOUser_ID)
        aCoder.encodeObject(uerPhoneNumber, forKey: KMOPhoneNumber)
        aCoder.encodeObject(userCity, forKey: KMOCity)
        aCoder.encodeObject(emailOfUser, forKey: kMOEmail)
        aCoder.encodeObject(userNames, forKey: kMOUserNames)
        aCoder.encodeObject(userCreatedAt, forKey: KMOCreate)
        aCoder.encodeObject(userCurrencyId, forKey: KMOCurrency_id)
        aCoder.encodeObject(userUpdatedAt, forKey: KMOUpdateAt)
        aCoder.encodeObject(userProfilePicture, forKey: KMOProfilePic)

    }
    

}
