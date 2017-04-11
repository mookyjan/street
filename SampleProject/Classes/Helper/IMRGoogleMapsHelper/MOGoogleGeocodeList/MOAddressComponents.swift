//
//  MOAddressComponents.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation

public class MOAddressComponents: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOAddressComponentsShortNameKey: String = "short_name"
	internal let kMOAddressComponentsTypesKey: String = "types"
	internal let kMOAddressComponentsLongNameKey: String = "long_name"


    // MARK: Properties
	public var shortName: String?
	public var types: [MOTypes]?
	public var longName: String?




    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if shortName != nil {
			dictionary.updateValue(shortName!, forKey: kMOAddressComponentsShortNameKey)
		}
		if types?.count > 0 {
			var temp: [AnyObject] = []
			for item in types! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kMOAddressComponentsTypesKey)
		}
		if longName != nil {
			dictionary.updateValue(longName!, forKey: kMOAddressComponentsLongNameKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.shortName = aDecoder.decodeObjectForKey(kMOAddressComponentsShortNameKey) as? String
		self.types = aDecoder.decodeObjectForKey(kMOAddressComponentsTypesKey) as? [MOTypes]
		self.longName = aDecoder.decodeObjectForKey(kMOAddressComponentsLongNameKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(shortName, forKey: kMOAddressComponentsShortNameKey)
		aCoder.encodeObject(types, forKey: kMOAddressComponentsTypesKey)
		aCoder.encodeObject(longName, forKey: kMOAddressComponentsLongNameKey)

    }

}
