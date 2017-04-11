//
//  MOUser.swift
//  STREET
//
//  Created by Ahmad on 01/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//


import UIKit
import Foundation

public class MOUser: NSObject , NSCoding
{
    internal let kMOUserId: String = "id"
    internal let kMOUserPhoneNumber: String = "phone"
    internal let kMOUserCityName: String = "city"
    internal let KMOUserEmail: String = "email"
    internal let KMOUserName: String = "name"
    internal let KMOUserCreatedAt: String = "created_at"
    internal let KMOUserCurrencyId: String = "currency_id"
    internal let KMOUserAppPin: String = "app_pin"
    internal let KMOUserProfilePic: String = "profile_picture"

    
    
    // MARK: Properties
    public var userID: Int!
    public var uerPhoneNum: String!
    public var cityName: String!
    public var userEmail: String!
    public var userName: String!
    public var createdAt: String!
    public var currencyId: String!
    public var updatedAt: String!
    public var appPin: String!
    public var profilePicture: String!

    
    convenience public init(object: AnyObject) {
        self.init(dictionary: object as! [String : AnyObject])
    }

    
    public init(dictionary: [String:AnyObject]) {
       
        userID = dictionary[kMOUserId] as? Int
        uerPhoneNum = dictionary[kMOUserPhoneNumber] as? String
        cityName = dictionary[kMOUserCityName] as? String
        userEmail = dictionary[KMOUserEmail] as? String
        userName = dictionary[KMOUserName] as? String
        createdAt = dictionary[KMOUserCreatedAt] as? String
        currencyId = dictionary[KMOUserCurrencyId] as? String
        appPin = dictionary[KMOUserAppPin] as? String
        profilePicture = dictionary[KMOUserProfilePic] as? String

    }
    
    // MARK: NSCoding Protocol
required public init(coder aDecoder: NSCoder) {
//        self.userID = aDecoder.decodeInt64ForKey(kMOUserId) as? Int
        self.uerPhoneNum = aDecoder.decodeObjectForKey(kMOUserPhoneNumber) as? String
        self.cityName = aDecoder.decodeObjectForKey(kMOUserCityName) as? String
        self.userEmail = aDecoder.decodeObjectForKey(KMOUserEmail) as? String
        self.userName = aDecoder.decodeObjectForKey(KMOUserName) as? String
        
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeObject(userID, forKey: kMOUserId)
        aCoder.encodeObject(uerPhoneNum, forKey: kMOUserPhoneNumber)
        aCoder.encodeObject(cityName, forKey: kMOUserCityName)
        aCoder.encodeObject(userEmail, forKey: KMOUserEmail)
        aCoder.encodeObject(userName, forKey: KMOUserName)
    }

    
}










