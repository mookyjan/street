//
//  MOMatchedSubstrings.swift
//
//  Created by Zeeshan Haider on 01/03/2016
//  Copyright (c) . All rights reserved.
//

import Foundation

public class MOMatchedSubstrings: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOMatchedSubstringsLengthKey: String = "length"
	internal let kMOMatchedSubstringsOffsetKey: String = "offset"


    // MARK: Properties
	public var length: Int?
	public var offset: Int?




    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if length != nil {
			dictionary.updateValue(length!, forKey: kMOMatchedSubstringsLengthKey)
		}
		if offset != nil {
			dictionary.updateValue(offset!, forKey: kMOMatchedSubstringsOffsetKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.length = aDecoder.decodeObjectForKey(kMOMatchedSubstringsLengthKey) as? Int
		self.offset = aDecoder.decodeObjectForKey(kMOMatchedSubstringsOffsetKey) as? Int

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(length, forKey: kMOMatchedSubstringsLengthKey)
		aCoder.encodeObject(offset, forKey: kMOMatchedSubstringsOffsetKey)

    }

}
