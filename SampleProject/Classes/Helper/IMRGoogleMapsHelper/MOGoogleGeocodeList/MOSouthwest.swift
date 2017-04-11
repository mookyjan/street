//
//  MOSouthwest.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation

public class MOSouthwest: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOSouthwestLatKey: String = "lat"
	internal let kMOSouthwestLngKey: String = "lng"


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
			dictionary.updateValue(lat!, forKey: kMOSouthwestLatKey)
		}
		if lng != nil {
			dictionary.updateValue(lng!, forKey: kMOSouthwestLngKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.lat = aDecoder.decodeObjectForKey(kMOSouthwestLatKey) as? Float
		self.lng = aDecoder.decodeObjectForKey(kMOSouthwestLngKey) as? Float

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(lat, forKey: kMOSouthwestLatKey)
		aCoder.encodeObject(lng, forKey: kMOSouthwestLngKey)

    }

}
