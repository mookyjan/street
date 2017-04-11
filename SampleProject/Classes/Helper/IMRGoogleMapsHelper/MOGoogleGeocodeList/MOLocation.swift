//
//  MOLocation.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation

public class MOLocation: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOLocationLatKey: String = "lat"
	internal let kMOLocationLngKey: String = "lng"


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
			dictionary.updateValue(lat!, forKey: kMOLocationLatKey)
		}
		if lng != nil {
			dictionary.updateValue(lng!, forKey: kMOLocationLngKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.lat = aDecoder.decodeObjectForKey(kMOLocationLatKey) as? Float
		self.lng = aDecoder.decodeObjectForKey(kMOLocationLngKey) as? Float

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(lat, forKey: kMOLocationLatKey)
		aCoder.encodeObject(lng, forKey: kMOLocationLngKey)

    }

}
