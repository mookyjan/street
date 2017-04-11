//
//  MOLoggedUser.swift
//
//  Created by Zeeshan Haider on 01/03/2016
//  Copyright (c) . All rights reserved.
//

import Foundation

public class MOLoggedUser: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOLoggedUserStatusKey: String = "status"
	internal let kMOLoggedUserMessageKey: String = "message"
	internal let kMOLoggedUserResultKey: String = "result"


    // MARK: Properties
	public var status: Int?
	public var message: String?
	public var result: [MOResult]?



    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if status != nil {
			dictionary.updateValue(status!, forKey: kMOLoggedUserStatusKey)
		}
		if message != nil {
			dictionary.updateValue(message!, forKey: kMOLoggedUserMessageKey)
		}
		if result?.count > 0 {
			var temp: [AnyObject] = []
			for item in result! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kMOLoggedUserResultKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.status = aDecoder.decodeObjectForKey(kMOLoggedUserStatusKey) as? Int
		self.message = aDecoder.decodeObjectForKey(kMOLoggedUserMessageKey) as? String
		self.result = aDecoder.decodeObjectForKey(kMOLoggedUserResultKey) as? [MOResult]

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(status, forKey: kMOLoggedUserStatusKey)
		aCoder.encodeObject(message, forKey: kMOLoggedUserMessageKey)
		aCoder.encodeObject(result, forKey: kMOLoggedUserResultKey)

    }

}
