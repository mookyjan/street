//
//  MOTypes.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import Foundation

public class MOTypes: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.


    // MARK: Properties




    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        let dictionary: [String : AnyObject ] = [ : ]

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {

    }

    public func encodeWithCoder(aCoder: NSCoder) {

    }

}
