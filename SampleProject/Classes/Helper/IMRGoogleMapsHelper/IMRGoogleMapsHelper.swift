
/*//
//  IMRGoogleGeoCoder.h
//  IReadyToSell
//
//  Created by Zeeshan Haider on 09/12/2015.
//  Copyright © 2015 DevBatch. All rights reserved.
//
import SVHTTPRequest
enum IMRGoogleGeoCoderResponse : Int {
    case ErrorOverQueryLimit
    // indicates that you are over your quota.
    case ErrorRequestDenied
    // indicates that your request was denied, generally because of lack of a sensor parameter.
    case ErrorInvalidRequest
    // generally indicates that the query (address or latlng) is missing.
    case ErrorUnknownError
    // indicates that the request could not be processed due to a server error. The request may succeed if you try again.
    case OK
    case OKZeroResults
    case UnknownError
}

///* --- This is the exception return codes --- */
//static int const kJSONResponseIsOK = -12345678;
//static int const kUnknownErrorCode = 0;
///* ------------------------------------------ */
typealias IMRGoogleDirectionsVoidBlock = () -> Void
typealias IMRGoogleDirectionsPlaceMarksBlock = (polyLine: MKPolyline, distance: String, duration: String, startAddress: String, endAddress: String, polyLineSetArray: [AnyObject], directionsSetArray: [AnyObject], distanceSetArray: [AnyObject]) -> Void
typealias IMRGoogleGeoCoderCompletionBlock = (googleGeoCodeList: MOGoogleGeocodeList, responseCode: IMRGoogleGeoCoderResponse, message: String) -> Void
typealias IMRGoogleAutoCompletionBlock = (googleAutocompleteList: MOGoogleAutoCompleteList, responseCode: IMRGoogleGeoCoderResponse, message: String) -> Void
class IMRGoogleMapsHelper: SVHTTPClient {
    /**
     *  Google API key. Not required, but result filtering on reverse geocoding is only available when set.
     */
    var APIKey: String
    /**
     *  Operation Queue for requesting a call. Currently not being used.
     */
    var requestQueue: NSOperationQueue
    /**
     *  sharedGoogleMapHelper
     *
     *  @return a singleton
     */

    class func sharedGoogleMapHelper() -> Self {
        var singleton: IMRGoogleMapsHelper
        singleton = IMRGoogleMapsHelper.sharedClientWithIdentifier(NSStringFromClass(self.self))
        singleton.APIKey = kGoogleAPIKey
        // Obtained from Google
        return singleton
    }
    /**
     *@description Asynchroniously queries the Google Geocoder API with the data provided.
     *@param query A free search query string
     *@param components A dictionary containing filters.
     *@see https://developers.google.com/maps/documentation/geocoding/#ComponentFiltering for possible filter values.
     *@param completionHandler Upon completion or failure this will be invoked. Passes an array of IRTSGooglePlacemark objects (or empty if no results). If an error occured, the "error" object will be != nil
     **/

    func geocodeAddressString(query: String, components: [NSObject : AnyObject], completionHandler completion: IMRGoogleGeoCoderCompletionBlock) {
        var params: [NSObject : AnyObject] = ["address": query, "sensor": "true"].mutableCopy
        if components != nil {
            var componentsString: String = ""
            components.enumerateKeysAndObjectsUsingBlock({(key: AnyObject, obj: AnyObject, stop: Bool) -> Void in
                componentsString = componentsString.stringByAppendingString("&\(key):\(obj)|")
            })
            if componentsString.length > 1 {
                componentsString = componentsString.substringToIndex(componentsString.length - 2)
            }
            params["components"] = componentsString
        }
        IMRGoogleMapsHelper.sharedGoogleMapHelper().cancelAllRequests()
        IMRGoogleMapsHelper.sharedGoogleMapHelper().GET("http://maps.googleapis.com/maps/api/geocode/json", parameters: params, completion: {(response: AnyObject, urlResponse: NSHTTPURLResponse, error: NSError) -> Void in
            var responseCode: IMRGoogleGeoCoderResponse = IMRGoogleMapsHelper.responseCodeFromJSONResponse(response)
            if responseCode == .OK || responseCode == .OKZeroResults {
                dispatch_async(dispatch_get_main_queue(), {() -> Void in
                    var geocode: MOGoogleGeocodeList = MOGoogleGeocodeList.modelObjectWithDictionary(response)
                    completion(geocode, responseCode, IMRGoogleMapsHelper.messageStringFromResponseCode(responseCode))
                })
            }
            else {
                dispatch_async(dispatch_get_main_queue(), {() -> Void in
                    completion(nil, responseCode, IMRGoogleMapsHelper.messageStringFromResponseCode(responseCode))
                })
            }
        })
    }
    /**
     *@description Asynchroniously queries the Google Geocoder API with the data provided.
     *@see https://developers.google.com/maps/documentation/geocoding/#Types and https://developers.google.com/maps/documentation/geocoding/#ReverseGeocoding for possible filter values.
     *@param coordinate Coordinate to look up
     *@param resultTypes A dictionary containing result type filters. NOTE: Ignored if APIKey == nil.
     *@param key — Your application's API key, obtained from the Google Developers Console. This key identifies your application for purposes of quota management.
     *@param language — The language in which to return results. See the list of supported domain languages. Note that we often update supported languages so this list may not be exhaustive. If language is not supplied, the geocoder will attempt to use the native language of the domain from which the request is sent wherever possible.
     *@param result_type — One or more address types, separated by a pipe (|). Examples of address types: country, street_address, postal_code. For a full list of allowable values, see the address types on this page. Specifying a type will restrict the results to this type. If multiple types are specified, the API will return all addresses that match any of the types. Note: This parameter is available only for requests that include an API key or a client ID.
     *@param location_type — One or more location types, separated by a pipe (|). Specifying a type will restrict the results to this type. If multiple types are specified, the API will return all addresses that match any of the types. Note: This parameter is available only for requests that include an API key or a client ID. The following values are supported:
     "ROOFTOP" restricts the results to addresses for which we have location information accurate down to street address precision.
     "RANGE_INTERPOLATED" restricts the results to those that reflect an approximation (usually on a road) interpolated between two precise points (such as intersections). An interpolated range generally indicates that rooftop geocodes are unavailable for a street address.
     "GEOMETRIC_CENTER" restricts the results to geometric centers of a location such as a polyline (for example, a street) or polygon (region).
     "APPROXIMATE" restricts the results to those that are characterized as approximate.
     
     If both result_type and location_type restrictions are present then the API will return only those results that matches both the result_type and the location_type restrictions.
     
     *@param locationTypes A dictionary containing location type filters. NOTE: Ignored if APIKey == nil.
     *@param completionHandler Upon completion or failure this will be invoked. Passes an array of NOGooglePlacemark objects (or empty if no results). If an error occured, the "error" object will be != nil
     **/

    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D, resultTypes: [AnyObject], locationTypes: [AnyObject], completionHandler completion: IMRGoogleGeoCoderCompletionBlock) {
        var params: [NSObject : AnyObject] = ["latlng": "\(coordinate.latitude),\(coordinate.longitude)"].mutableCopy
        if locationTypes {
            var typesString: String = ""
            locationTypes.enumerateObjectsUsingBlock({(obj: AnyObject, idx: Int, stop: Bool) -> Void in
                typesString = typesString.stringByAppendingString("\(obj)|")
            })
            if typesString.length > 1 {
                typesString = typesString.substringToIndex(typesString.length - 1)
            }
            params["location_type"] = typesString
        }
        if resultTypes {
            var typesString: String = ""
            resultTypes.enumerateObjectsUsingBlock({(obj: AnyObject, idx: Int, stop: Bool) -> Void in
                typesString = typesString.stringByAppendingString("\(obj)|")
            })
            if typesString.length > 1 {
                typesString = typesString.substringToIndex(typesString.length - 1)
            }
            params["result_type"] = typesString
        }
        IMRGoogleMapsHelper.sharedGoogleMapHelper().cancelAllRequests()
        IMRGoogleMapsHelper.sharedGoogleMapHelper().GET("http://maps.googleapis.com/maps/api/geocode/json", parameters: params, completion: {(response: AnyObject, urlResponse: NSHTTPURLResponse, error: NSError) -> Void in
            var responseCode: IMRGoogleGeoCoderResponse = IMRGoogleMapsHelper.responseCodeFromJSONResponse(response)
            if responseCode == .OK || responseCode == .OKZeroResults {
                var googleGeoCodeList: MOGoogleGeocodeList = MOGoogleGeocodeList.modelObjectWithDictionary(response)
                dispatch_async(dispatch_get_main_queue(), {() -> Void in
                    completion(googleGeoCodeList, responseCode, IMRGoogleMapsHelper.messageStringFromResponseCode(responseCode))
                })
            }
            else {
                dispatch_async(dispatch_get_main_queue(), {() -> Void in
                    completion(nil, responseCode, IMRGoogleMapsHelper.messageStringFromResponseCode(responseCode))
                })
            }
        })
    }
    /**
     *  <#Description#>
     *
     *  @param coordinateSource      <#coordinateSource description#>
     *  @param coordinateDestination <#coordinateDestination description#>
     *  @param drawPoints            <#drawPoints description#>
     *  @param placeMarks            <#placeMarks description#>
     */

    func getDirections(coordinateSource: CLLocationCoordinate2D, andCoordinateDestination coordinateDestination: CLLocationCoordinate2D, andDrawPoints drawPoints: IMRGoogleDirectionsVoidBlock, andPlaceMarks placeMarks: IMRGoogleDirectionsPlaceMarksBlock) {
        SVProgressHUD.show()
        IMRGoogleMapsHelper.sharedGoogleMapHelper().cancelAllRequests()
        IMRGoogleMapsHelper.sharedGoogleMapHelper().GET("http://maps.googleapis.com/maps/api/directions/json?origin=\("\(coordinateSource.latitude),\(coordinateSource.longitude)")&destination=\("\(coordinateDestination.latitude),\(coordinateDestination.longitude)")&mode=driving", parameters: nil, completion: {(response: AnyObject, urlResponse: NSHTTPURLResponse, error: NSError) -> Void in
            SVProgressHUD.dismiss()
            if !error {
                if (response.utilities_objectForKeyNotNull("status") == "ZERO_RESULTS") {
                    SVProgressHUD.showErrorWithStatus("Failed to get directions")
                    return
                }
                var routeArray: [AnyObject] = response.utilities_objectForKeyNotNull("routes")
                var routeSetAry: [AnyObject] = NSMutableArray()
                var directionStrAry: [AnyObject] = NSMutableArray()
                var encodedPoints: [AnyObject]
                var polylineSetAry: [AnyObject] = NSMutableArray()
                var distanceStrAry: [AnyObject] = NSMutableArray()
                for var i = 0; i < routeArray.count; i++ {
                    var tempDictionary: [NSObject : AnyObject] = routeArray[i]
                    if (tempDictionary["overview_polyline"] as! String) != nil {
                        var secTempDictionary: [NSObject : AnyObject] = (tempDictionary["overview_polyline"] as! [NSObject : AnyObject])
                        if (secTempDictionary["points"] as! String) != nil {
                            var routePoint: String = (secTempDictionary["points"] as! String)
                            routeSetAry.append(routePoint)
                            encodedPoints = (secTempDictionary["points"] as! String)
                        }
                        // NSLog(@"secTempDictionary is: %@", secTempDictionary);
                    }
                    if (tempDictionary["legs"] as! String) != nil {
                        var lagArray: [AnyObject] = [AnyObject]()
                        lagArray = (tempDictionary["legs"] as! String)
                        for var i = 0; i < lagArray.count; i++ {
                            var thirdTempDictionary: [NSObject : AnyObject] = lagArray[i]
                            if (thirdTempDictionary["steps"] as! String) != nil {
                                var stepsArray: [AnyObject] = [AnyObject]()
                                stepsArray = (thirdTempDictionary["steps"] as! String)
                                for var i = 0; i < stepsArray.count; i++ {
                                    var forthTempDictionary: [NSObject : AnyObject] = stepsArray[i]
                                    if (forthTempDictionary["html_instructions"] as! String) != nil {
                                        var directionStr: String = (forthTempDictionary["html_instructions"] as! String)
                                            var range: NSRange
                                        while (range = directionStr.rangeOfString("<[^>]+>", options: NSRegularExpressionSearch)).location != NSNotFound {
                                            directionStr = directionStr.stringByReplacingCharactersInRange(range, withString: "")
                                        }
                                        directionStrAry.append(directionStr)
                                    }
                                    var fifthTempDictionary: [NSObject : AnyObject] = (forthTempDictionary["polyline"] as! [NSObject : AnyObject])
                                    if (fifthTempDictionary["points"] as! String) != nil {
                                        var routePoint: String = (fifthTempDictionary["points"] as! String)
                                        polylineSetAry.append(routePoint)
                                        // encodedPoints = [fifthTempDictionary objectForKey:@"points"];
                                    }
                                    var sixthTempDictionary: [NSObject : AnyObject] = (forthTempDictionary["distance"] as! [NSObject : AnyObject])
                                    if (sixthTempDictionary["text"] as! String) != nil {
                                        var distanceStr: String = (sixthTempDictionary["text"] as! String)
                                        distanceStrAry.append(distanceStr)
                                        // encodedPoints = [fifthTempDictionary objectForKey:@"points"];
                                    }
                                }
                            }
                        }
                    }
                }
                var route: [NSObject : AnyObject] = routeArray.lastObject()
                if route != nil {
                    self.parseResponse(response, andDrawPoints: drawPoints, andPlaceMarks: placeMarks, andPolyLineSetArray: polylineSetAry, andDirectionsSetArray: directionStrAry, andDistanceSetArray: distanceStrAry)
                }
            }
            else {
                SVProgressHUD.showErrorWithStatus(error.localizedDescription)
            }
        })
    }
    /**
     *  Google autocomplete for places will res
     *
     *  @param keyWord      <#keyWord description#>
     *  @param autocomplete <#autocomplete description#>
     */

    func getAutoCompleteFromGoogle(keyWord: String, andAutoComplete autocomplete: IMRGoogleAutoCompletionBlock) {
        IMRGoogleMapsHelper.sharedGoogleMapHelper().cancelAllRequests()
        IMRGoogleMapsHelper.sharedGoogleMapHelper().GET("https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(keyWord.utilities_urlEncode())&key=\(kGoogleAPIKey)", parameters: nil, completion: {(response: AnyObject, urlResponse: NSHTTPURLResponse, error: NSError) -> Void in
            var autocompleteList: MOGoogleAutoCompleteList = MOGoogleAutoCompleteList.modelObjectWithDictionary(response)
            var responseCode: IMRGoogleGeoCoderResponse = IMRGoogleMapsHelper.responseCodeFromJSONResponse(response)
            autocomplete(autocompleteList, responseCode, IMRGoogleMapsHelper.messageStringFromResponseCode(responseCode))
        })
    }

    convenience override init() {
        self.init()
        if self != nil {
            //        self.requestQueue = [[NSOperationQueue alloc] init];
            //        self.requestQueue.maxConcurrentOperationCount = 1;
        }
    }

    class func isJSONResponseSuccessful(JSON: AnyObject, forURL url: NSURL) -> Bool {
                    return false

        return false
    }

    class func dataContentFromJSONResponse(JSON: AnyObject, forURL url: NSURL) -> AnyObject {
        return (JSON["results"] as! String)
    }

    class func responseCodeFromJSONResponse(JSON: AnyObject) -> IMRGoogleGeoCoderResponse {
        var status: String = (JSON["status"] as! String)
        NSLog("status: %@", status)
        if (status is NSString.self) {
            if (status == "OK") {
                return .OK
            }
            else if (status == "ZERO_RESULTS") {
                return .OKZeroResults
            }
            else if (status == "OVER_QUERY_LIMIT") {
                return .ErrorOverQueryLimit
            }
            else if (status == "REQUEST_DENIED") {
                return .ErrorRequestDenied
            }
            else if (status == "INVALID_REQUEST") {
                return .ErrorInvalidRequest
            }
            else if (status == "UNKNOWN_ERROR") {
                return .ErrorUnknownError
            }
        }
        return .UnknownError
    }

    class func messageStringFromResponseCode(responseCode: IMRGoogleGeoCoderResponse) -> String {
        var status: String = ""
        NSLog("status: %@", status)
        if responseCode == .OK {
            return "Processed successfully."
        }
        else if responseCode == .OKZeroResults {
            return "No results found!"
        }
        else if responseCode == .ErrorOverQueryLimit {
            return "Query over limit."
        }
        else if responseCode == .ErrorRequestDenied {
            return "Request is denied"
        }
        else if responseCode == .ErrorInvalidRequest {
            return "Invalid request"
        }
        else if responseCode == .ErrorUnknownError {
            return "Unknown error"
        }

        return "No error"
    }

    func parseResponse(response: [NSObject : AnyObject], andDrawPoints drawPoints: IMRGoogleDirectionsVoidBlock, andPlaceMarks placeMarks: IMRGoogleDirectionsPlaceMarksBlock, andPolyLineSetArray polyLineSetArray: [AnyObject], andDirectionsSetArray directionStrAry: [AnyObject], andDistanceSetArray distanceStrAry: [AnyObject]) {
        drawPoints()
        var routes: [AnyObject] = (response["routes"] as! [AnyObject])
        var route: [NSObject : AnyObject] = routes.lastObject()
        if route != nil {
            var legs: [AnyObject] = (route["legs"] as! [AnyObject])
            var routeTime: [NSObject : AnyObject] = legs.lastObject()
            var distance: String = ((routeTime["distance"] as! String)["text"] as! String)
            var duration: String = ((routeTime["duration"] as! String)["text"] as! String)
            var endAddress: String = (routeTime["end_address"] as! String)
            var startAddress: String = (routeTime["start_address"] as! String)
            var overviewPolyline: String = ((route["overview_polyline"] as! String)["points"] as! String)
            var arrRoutePoints: [AnyObject] = self.decodePolyLine(overviewPolyline)
            var numberOfSteps: Int = arrRoutePoints.count
            var coordinates: CLLocationCoordinate2D
            for var index = 0; index < numberOfSteps; index++ {
                var location: CLLocation = arrRoutePoints[index]
                var coordinate: CLLocationCoordinate2D = location.coordinate
                coordinates[index] = coordinate
            }
            var polyLine: MKPolyline = MKPolyline.polylineWithCoordinates(coordinates, count: numberOfSteps)
            placeMarks(polyLine, distance, duration, startAddress, endAddress, polyLineSetArray, distanceStrAry, directionStrAry)
        }
    }

    func decodePolyLine(encodedStr: String) -> [AnyObject] {
    }
}
//
//  IMRGoogleGeoCoder.m
//  IReadyToSell
//
//  Created by Zeeshan Haider on 09/12/2015.
//  Copyright © 2015 DevBatch. All rights reserved.
//
*/