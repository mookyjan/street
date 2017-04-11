//
//  MOSuggestShop.swift
//  STREET
//
//  Created by Waris Shams on 06/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

public class MOSuggestShop: NSObject , NSCoding
{
    internal let KMOShop_ID: String = "id"
    internal let KMOShop_Title: String = "title"
    internal let KMOShop_Description: String = "description"
    internal let KMOShop_Campaigns_count: String = "campaigns_count"
    
    // MARK: Properties

    public var shopId: Int!
    public var shopTitle: String!
    public var shopDescription: String!
    public var shopCampaignCount: String!
    
    
    convenience public init(object: AnyObject) {
        self.init(dictionary: object as! [String : AnyObject])
    }

    public init(dictionary: [String:AnyObject]) {
        
        shopId = dictionary[KMOShop_ID] as? Int
        shopTitle = dictionary[KMOShop_Title] as? String
        shopDescription = dictionary[KMOShop_Description] as? String
        shopCampaignCount = dictionary[KMOShop_Campaigns_count] as? String
        
    }
    
    // MARK: NSCoding Protocol
   
    required public init(coder aDecoder: NSCoder)
    {
//        self.shopId = aDecoder.decodeIntForKey(KMOShop_ID) as? Int
        self.shopTitle = aDecoder.decodeObjectForKey(KMOShop_Title) as? String
        self.shopDescription = aDecoder.decodeObjectForKey(KMOShop_Description) as? String
        self.shopCampaignCount = aDecoder.decodeObjectForKey(KMOShop_Campaigns_count) as? String
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {

        aCoder.encodeObject(shopId, forKey: KMOShop_ID)
        aCoder.encodeObject(shopTitle, forKey: KMOShop_Title)
        aCoder.encodeObject(shopDescription, forKey: KMOShop_Description)
        aCoder.encodeObject(shopCampaignCount, forKey: KMOShop_Campaigns_count)
    }


}
