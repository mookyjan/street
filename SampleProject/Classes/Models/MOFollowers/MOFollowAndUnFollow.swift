//
//  MOFollowAndUnFollow.swift
//  STREET
//
//  Created by Waris Shams on 05/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

public class MOFollowAndUnFollow: NSObject {

    internal let KMOUser_Id: String = "id"
    internal let kMOFollowing_Id: String = "followable_id"
    internal let kMOFollowable_type: String = "followable_type"
    internal let KMOFollower_id: String = "follower_id"
    internal let KMOFollower_type: String = "follower_type"
    internal let KMOCreated_at: String = "created_at"
    internal let KMOUpdated_at: String = "updated_at"
    
    
    // MARK: Properties
    public var user_ID: String!
    public var followingId: String!
    public var followable_Type: String!
    public var follower_ID: String!
    public var follower_Type: String!
    public var blocked : Bool!
    public var created_At: String!
    public var updated_At: String!
    
    
    convenience public init(object: AnyObject) {
        self.init(dictionary: object as! [String : AnyObject])
    }
    
    public init(dictionary: [String:AnyObject]) {
        
        user_ID = dictionary[KMOUser_Id] as? String
        followingId = dictionary[kMOFollowing_Id] as? String
        followable_Type = dictionary[kMOFollowable_type] as? String
        follower_ID = dictionary[KMOFollower_id] as? String
        follower_Type = dictionary[KMOFollower_type] as? String
        blocked = dictionary["blocked"] as? Bool
        created_At = dictionary[KMOCreated_at] as? String
        updated_At = dictionary[KMOUpdated_at] as? String
        
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.user_ID = aDecoder.decodeObjectForKey(KMOUser_Id) as? String
        self.followingId = aDecoder.decodeObjectForKey(kMOFollowing_Id) as? String
        self.followable_Type = aDecoder.decodeObjectForKey(kMOFollowable_type) as? String
        self.follower_ID = aDecoder.decodeObjectForKey(KMOFollower_id) as? String
        self.created_At = aDecoder.decodeObjectForKey(KMOCreated_at) as? String
        self.updated_At = aDecoder.decodeObjectForKey(KMOUpdated_at) as? String
        self.blocked = aDecoder.decodeBoolForKey("blocked") as Bool
        
        
        
    }

    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(user_ID, forKey: KMOUser_Id)
        aCoder.encodeObject(followingId, forKey: kMOFollowing_Id)
        aCoder.encodeObject(followable_Type, forKey: kMOFollowable_type)
        aCoder.encodeObject(follower_ID, forKey: KMOFollower_id)
        aCoder.encodeObject(created_At, forKey: KMOCreated_at)
        aCoder.encodeObject(updated_At, forKey: KMOUpdated_at)
        aCoder.encodeObject(blocked, forKey: "blocked")

    }
    

}
