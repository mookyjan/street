//
//  MOPredictions.swift
//
//  Created by Zeeshan Haider on 01/03/2016
//  Copyright (c) . All rights reserved.
//

import Foundation

public class MOPredictions: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOPredictionsMatchedSubstringsKey: String = "matched_substrings"
	internal let kMOPredictionsInternalIdentifierKey: String = "id"
	internal let kMOPredictionsPlaceIdKey: String = "place_id"
	internal let kMOPredictionsTermsKey: String = "terms"
	internal let kMOPredictionsDescriptionValueKey: String = "description"
	internal let kMOPredictionsReferenceKey: String = "reference"
	internal let kMOPredictionsTypesKey: String = "types"


    // MARK: Properties
	public var matchedSubstrings: [MOMatchedSubstrings]?
	public var internalIdentifier: String?
	public var placeId: String?
	public var terms: [MOTerms]?
	public var descriptionValue: String?
	public var reference: String?
	public var types: [MOTypes]?




    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if matchedSubstrings?.count > 0 {
			var temp: [AnyObject] = []
			for item in matchedSubstrings! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kMOPredictionsMatchedSubstringsKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kMOPredictionsInternalIdentifierKey)
		}
		if placeId != nil {
			dictionary.updateValue(placeId!, forKey: kMOPredictionsPlaceIdKey)
		}
		if terms?.count > 0 {
			var temp: [AnyObject] = []
			for item in terms! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kMOPredictionsTermsKey)
		}
		if descriptionValue != nil {
			dictionary.updateValue(descriptionValue!, forKey: kMOPredictionsDescriptionValueKey)
		}
		if reference != nil {
			dictionary.updateValue(reference!, forKey: kMOPredictionsReferenceKey)
		}
		if types?.count > 0 {
			var temp: [AnyObject] = []
			for item in types! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kMOPredictionsTypesKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.matchedSubstrings = aDecoder.decodeObjectForKey(kMOPredictionsMatchedSubstringsKey) as? [MOMatchedSubstrings]
		self.internalIdentifier = aDecoder.decodeObjectForKey(kMOPredictionsInternalIdentifierKey) as? String
		self.placeId = aDecoder.decodeObjectForKey(kMOPredictionsPlaceIdKey) as? String
		self.terms = aDecoder.decodeObjectForKey(kMOPredictionsTermsKey) as? [MOTerms]
		self.descriptionValue = aDecoder.decodeObjectForKey(kMOPredictionsDescriptionValueKey) as? String
		self.reference = aDecoder.decodeObjectForKey(kMOPredictionsReferenceKey) as? String
		self.types = aDecoder.decodeObjectForKey(kMOPredictionsTypesKey) as? [MOTypes]

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(matchedSubstrings, forKey: kMOPredictionsMatchedSubstringsKey)
		aCoder.encodeObject(internalIdentifier, forKey: kMOPredictionsInternalIdentifierKey)
		aCoder.encodeObject(placeId, forKey: kMOPredictionsPlaceIdKey)
		aCoder.encodeObject(terms, forKey: kMOPredictionsTermsKey)
		aCoder.encodeObject(descriptionValue, forKey: kMOPredictionsDescriptionValueKey)
		aCoder.encodeObject(reference, forKey: kMOPredictionsReferenceKey)
		aCoder.encodeObject(types, forKey: kMOPredictionsTypesKey)

    }

}
