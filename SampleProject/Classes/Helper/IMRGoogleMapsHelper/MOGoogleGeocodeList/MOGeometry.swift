//
//  MOGeometry.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation

public class MOGeometry: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOGeometryLocationKey: String = "location"
	internal let kMOGeometryBoundsKey: String = "bounds"
	internal let kMOGeometryViewportKey: String = "viewport"
	internal let kMOGeometryLocationTypeKey: String = "location_type"


    // MARK: Properties
	public var location: MOLocation?
	public var bounds: MOBounds?
	public var viewport: MOViewport?
	public var locationType: String?




    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if location != nil {
			dictionary.updateValue(location!.dictionaryRepresentation(), forKey: kMOGeometryLocationKey)
		}
		if bounds != nil {
			dictionary.updateValue(bounds!.dictionaryRepresentation(), forKey: kMOGeometryBoundsKey)
		}
		if viewport != nil {
			dictionary.updateValue(viewport!.dictionaryRepresentation(), forKey: kMOGeometryViewportKey)
		}
		if locationType != nil {
			dictionary.updateValue(locationType!, forKey: kMOGeometryLocationTypeKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.location = aDecoder.decodeObjectForKey(kMOGeometryLocationKey) as? MOLocation
		self.bounds = aDecoder.decodeObjectForKey(kMOGeometryBoundsKey) as? MOBounds
		self.viewport = aDecoder.decodeObjectForKey(kMOGeometryViewportKey) as? MOViewport
		self.locationType = aDecoder.decodeObjectForKey(kMOGeometryLocationTypeKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(location, forKey: kMOGeometryLocationKey)
		aCoder.encodeObject(bounds, forKey: kMOGeometryBoundsKey)
		aCoder.encodeObject(viewport, forKey: kMOGeometryViewportKey)
		aCoder.encodeObject(locationType, forKey: kMOGeometryLocationTypeKey)

    }

}
