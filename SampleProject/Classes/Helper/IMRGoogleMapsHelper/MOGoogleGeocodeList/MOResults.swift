//
//  MOResults.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation

public class MOResults: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOResultsTypesKey: String = "types"
	internal let kMOResultsAddressComponentsKey: String = "address_components"
	internal let kMOResultsPlaceIdKey: String = "place_id"
	internal let kMOResultsGeometryKey: String = "geometry"
	internal let kMOResultsFormattedAddressKey: String = "formatted_address"


    // MARK: Properties
	public var types: [MOTypes]?
	public var addressComponents: [MOAddressComponents]?
	public var placeId: String?
	public var geometry: MOGeometry?
	public var formattedAddress: String?




    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if types?.count > 0 {
			var temp: [AnyObject] = []
			for item in types! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kMOResultsTypesKey)
		}
		if addressComponents?.count > 0 {
			var temp: [AnyObject] = []
			for item in addressComponents! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kMOResultsAddressComponentsKey)
		}
		if placeId != nil {
			dictionary.updateValue(placeId!, forKey: kMOResultsPlaceIdKey)
		}
		if geometry != nil {
			dictionary.updateValue(geometry!.dictionaryRepresentation(), forKey: kMOResultsGeometryKey)
		}
		if formattedAddress != nil {
			dictionary.updateValue(formattedAddress!, forKey: kMOResultsFormattedAddressKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.types = aDecoder.decodeObjectForKey(kMOResultsTypesKey) as? [MOTypes]
		self.addressComponents = aDecoder.decodeObjectForKey(kMOResultsAddressComponentsKey) as? [MOAddressComponents]
		self.placeId = aDecoder.decodeObjectForKey(kMOResultsPlaceIdKey) as? String
		self.geometry = aDecoder.decodeObjectForKey(kMOResultsGeometryKey) as? MOGeometry
		self.formattedAddress = aDecoder.decodeObjectForKey(kMOResultsFormattedAddressKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(types, forKey: kMOResultsTypesKey)
		aCoder.encodeObject(addressComponents, forKey: kMOResultsAddressComponentsKey)
		aCoder.encodeObject(placeId, forKey: kMOResultsPlaceIdKey)
		aCoder.encodeObject(geometry, forKey: kMOResultsGeometryKey)
		aCoder.encodeObject(formattedAddress, forKey: kMOResultsFormattedAddressKey)

    }

}
