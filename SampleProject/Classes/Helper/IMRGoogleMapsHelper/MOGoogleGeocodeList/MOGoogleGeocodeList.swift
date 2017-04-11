//
//  MOGoogleGeocodeList.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation

public class MOGoogleGeocodeList: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOGoogleGeocodeListStatusKey: String = "status"
	internal let kMOGoogleGeocodeListResultsKey: String = "results"


    // MARK: Properties
	public var status: String?
	public var results: [MOResults]?




    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if status != nil {
			dictionary.updateValue(status!, forKey: kMOGoogleGeocodeListStatusKey)
		}
		if results?.count > 0 {
			var temp: [AnyObject] = []
			for item in results! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kMOGoogleGeocodeListResultsKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.status = aDecoder.decodeObjectForKey(kMOGoogleGeocodeListStatusKey) as? String
		self.results = aDecoder.decodeObjectForKey(kMOGoogleGeocodeListResultsKey) as? [MOResults]

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(status, forKey: kMOGoogleGeocodeListStatusKey)
		aCoder.encodeObject(results, forKey: kMOGoogleGeocodeListResultsKey)

    }

}
