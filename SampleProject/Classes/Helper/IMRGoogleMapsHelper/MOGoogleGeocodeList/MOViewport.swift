//
//  MOViewport.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation

public class MOViewport: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOViewportNortheastKey: String = "northeast"
	internal let kMOViewportSouthwestKey: String = "southwest"


    // MARK: Properties
	public var northeast: MONortheast?
	public var southwest: MOSouthwest?




    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if northeast != nil {
			dictionary.updateValue(northeast!.dictionaryRepresentation(), forKey: kMOViewportNortheastKey)
		}
		if southwest != nil {
			dictionary.updateValue(southwest!.dictionaryRepresentation(), forKey: kMOViewportSouthwestKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.northeast = aDecoder.decodeObjectForKey(kMOViewportNortheastKey) as? MONortheast
		self.southwest = aDecoder.decodeObjectForKey(kMOViewportSouthwestKey) as? MOSouthwest

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(northeast, forKey: kMOViewportNortheastKey)
		aCoder.encodeObject(southwest, forKey: kMOViewportSouthwestKey)

    }

}
