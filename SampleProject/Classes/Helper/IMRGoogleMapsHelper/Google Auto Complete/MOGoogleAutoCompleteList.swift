//
//  MOGoogleAutoCompleteList.swift
//
//  Created by Zeeshan Haider on 01/03/2016
//  Copyright (c) . All rights reserved.
//

import Foundation

public class MOGoogleAutoCompleteList: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOGoogleAutoCompleteListStatusKey: String = "status"
	internal let kMOGoogleAutoCompleteListPredictionsKey: String = "predictions"


    // MARK: Properties
	public var status: String?
	public var predictions: [MOPredictions]?




    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if status != nil {
			dictionary.updateValue(status!, forKey: kMOGoogleAutoCompleteListStatusKey)
		}
		if predictions?.count > 0 {
			var temp: [AnyObject] = []
			for item in predictions! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kMOGoogleAutoCompleteListPredictionsKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.status = aDecoder.decodeObjectForKey(kMOGoogleAutoCompleteListStatusKey) as? String
		self.predictions = aDecoder.decodeObjectForKey(kMOGoogleAutoCompleteListPredictionsKey) as? [MOPredictions]

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(status, forKey: kMOGoogleAutoCompleteListStatusKey)
		aCoder.encodeObject(predictions, forKey: kMOGoogleAutoCompleteListPredictionsKey)

    }

}
