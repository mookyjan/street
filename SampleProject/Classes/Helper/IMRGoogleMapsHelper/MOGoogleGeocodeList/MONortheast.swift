//
//  MONortheast.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation

public class MONortheast: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMONortheastLatKey: String = "lat"
	internal let kMONortheastLngKey: String = "lng"


    // MARK: Properties
	public var lat: Float?
	public var lng: Float?

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if lat != nil {
			dictionary.updateValue(lat!, forKey: kMONortheastLatKey)
		}
		if lng != nil {
			dictionary.updateValue(lng!, forKey: kMONortheastLngKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.lat = aDecoder.decodeObjectForKey(kMONortheastLatKey) as? Float
		self.lng = aDecoder.decodeObjectForKey(kMONortheastLngKey) as? Float

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(lat, forKey: kMONortheastLatKey)
		aCoder.encodeObject(lng, forKey: kMONortheastLngKey)

    }

}
