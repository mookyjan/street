//
//  MOTerms.swift
//
//  Created by Zeeshan Haider on 01/03/2016
//  Copyright (c) . All rights reserved.
//

import Foundation

public class MOTerms: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOTermsOffsetKey: String = "offset"
	internal let kMOTermsValueKey: String = "value"


    // MARK: Properties
	public var offset: Int?
	public var value: String?

    override init() {
        
    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if offset != nil {
			dictionary.updateValue(offset!, forKey: kMOTermsOffsetKey)
		}
		if value != nil {
			dictionary.updateValue(value!, forKey: kMOTermsValueKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.offset = aDecoder.decodeObjectForKey(kMOTermsOffsetKey) as? Int
		self.value = aDecoder.decodeObjectForKey(kMOTermsValueKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(offset, forKey: kMOTermsOffsetKey)
		aCoder.encodeObject(value, forKey: kMOTermsValueKey)

    }

}
