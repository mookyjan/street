//
//  SampleStorageHelper.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//


//import CoreData
////import AppKit
//import Foundation
//
//class SampleStorageHelper : NSManagedObject {
//    
//    var traversed: Bool?
//    static let DbName:String = "Pryvate.sqlite"
//    
//    static var _customManagedObjectContext : NSManagedObjectContext?
//    
//    // MARK: - Core Data stack
//    
//    static var applicationDocumentsDirectory: NSURL {
//        get{
//        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.devbatch.tmp.Pryvate" in the user's Application Support directory.
//            let urls = NSFileManager.defaultManager().URLsForDirectory(.ApplicationSupportDirectory, inDomains: .UserDomainMask)
//            let appSupportURL = urls[urls.count - 1]
//            return appSupportURL.URLByAppendingPathComponent("com.devbatch.tmp.Pryvate")
//        }
//    }
//    
//    static var managedObjectModel: NSManagedObjectModel{
//        get{
//            // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
//            let modelURL = NSBundle.mainBundle().URLForResource("Pryvate", withExtension: "momd")!
//            return NSManagedObjectModel(contentsOfURL: modelURL)!
//        }
//    }
//    
//    static var persistentStoreCoordinator: NSPersistentStoreCoordinator {
//        get{
//            // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. (The directory for the store is created, if necessary.) This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
//            let fileManager = NSFileManager.defaultManager()
//            var failError: NSError? = nil
//            var shouldFail = false
//            var failureReason = "There was an error creating or loading the application's saved data."
//            
//            // Make sure the application files directory is there
//            do {
//                let properties = try applicationDocumentsDirectory.resourceValuesForKeys([NSURLIsDirectoryKey])
//                if !properties[NSURLIsDirectoryKey]!.boolValue {
//                    failureReason = "Expected a folder to store application data, found a file \(self.applicationDocumentsDirectory.path)."
//                    shouldFail = true
//                }
//            } catch  {
//                let nserror = error as NSError
//                if nserror.code == NSFileReadNoSuchFileError {
//                    do {
//                        try fileManager.createDirectoryAtPath(applicationDocumentsDirectory.path!, withIntermediateDirectories: true, attributes: nil)
//                    } catch {
//                        failError = nserror
//                    }
//                } else {
//                    failError = nserror
//                }
//            }
//            
//            // Create the coordinator and store
//            var coordinator: NSPersistentStoreCoordinator? = nil
//            if failError == nil {
//                coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
//                let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("CocoaAppCD.storedata")
//                do {
//                    try coordinator!.addPersistentStoreWithType(NSXMLStoreType, configuration: nil, URL: url, options: nil)
//                } catch {
//                    failError = error as NSError
//                }
//            }
//            
//            if shouldFail || (failError != nil) {
//                // Report any error we got.
//                var dict = [String: AnyObject]()
//                dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
//                dict[NSLocalizedFailureReasonErrorKey] = failureReason
//                if failError != nil {
//                    dict[NSUnderlyingErrorKey] = failError
//                }
//                let error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
//                NSApplication.sharedApplication().presentError(error)
//                abort()
//            } else {
//                return coordinator!
//            }
//        }
//    }
//    
//    static var customManagedObjectContext: NSManagedObjectContext {
//        get{
//        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
//            if _customManagedObjectContext != nil {
//                return _customManagedObjectContext!
//            }
//            let coordinator = persistentStoreCoordinator
//            _customManagedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
//            _customManagedObjectContext!.persistentStoreCoordinator = coordinator
//            return _customManagedObjectContext!
//        }
//    }
//    
//    
//    // MARK: - Core Data Stack
//
//    
//    // MARK: - IO Operations
//    class func create() -> NSManagedObject {
//        let entityName: String = "\(self)"
//        let obj: NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: customManagedObjectContext)
//        
//        return obj
//    }
//    
//    class func save() {
//
//        if !customManagedObjectContext.commitEditing() {
//            NSLog("\(NSStringFromClass(self)) unable to commit editing before saving")
//        }
//        if customManagedObjectContext.hasChanges {
//            do {
//                try customManagedObjectContext.save()
//            } catch {
//                let nserror = error as NSError
//                NSApplication.sharedApplication().presentError(nserror)
//            }
//        }
//    }
//    
//    class func deleteObject(object: NSManagedObject) {
//        customManagedObjectContext.deleteObject(object)
//        self.save()
//    }
//    
//    class func deleteAllObjects() {
//        for obj in self.fetchAll() {
//            customManagedObjectContext.deleteObject(obj as! NSManagedObject)
//        }
//        self.save()
//    }
//    
//    class func fetchAll() -> [AnyObject] {
//        return self.fetchWithPredicate(nil, sortDescriptors: nil, limit: 0)!
//    }
//    
//    class func fetchWithPredicate(filter: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, limit: Int) -> [AnyObject]? {
//        let entityName: String = "\(self)"
//        let fetchRequest: NSFetchRequest = NSFetchRequest()
//        let entity: NSEntityDescription = NSEntityDescription.entityForName(entityName, inManagedObjectContext: customManagedObjectContext)!
//        fetchRequest.fetchBatchSize = 30
//        fetchRequest.entity = entity
//        if filter != nil {
//            fetchRequest.predicate = filter
//        }
//        if sortDescriptors?.isEmpty == false {
//            fetchRequest.sortDescriptors = sortDescriptors
//        }
//        if limit > 0 {
//            fetchRequest.fetchLimit = limit
//        }
//        
//        do {
//            let results = try customManagedObjectContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
//            return results
//        } catch let error as NSError {
//            print("Error in Getting Core-Data Record: \(error.localizedDescription)")
//            return nil
//        }
//    }
//    
//    class func fetchWithEntity(entityName: String, filter: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, fetchLimit limit: Int) -> [AnyObject]? {
//        let fetchRequest: NSFetchRequest = NSFetchRequest()
//        let entity: NSEntityDescription = NSEntityDescription.entityForName(entityName, inManagedObjectContext: customManagedObjectContext)!
//        fetchRequest.fetchBatchSize = 30
//        fetchRequest.entity = entity
//        if filter != nil {
//            fetchRequest.predicate = filter
//        }
//        if sortDescriptors != nil {
//            fetchRequest.sortDescriptors = sortDescriptors
//        }
//        if limit > 0 {
//            fetchRequest.fetchLimit = limit
//        }
//        do {
//            let results = try customManagedObjectContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
//            return results
//        } catch let error as NSError {
//            print("Error in Getting Core-Data Record: \(error.localizedDescription)")
//            return nil
//        }
//    }
//    
//    class func count() -> Int {
//        let fetchRequest: NSFetchRequest = NSFetchRequest(entityName: "\(self)")
//        var error: NSError? = nil
//        let count = customManagedObjectContext.countForFetchRequest(fetchRequest, error: &error)
//        return count
//    }
//    
////    class func maxIdOfAttributs(attribute: String) -> Int32 {
////        var entityName: String = "\(self)"
////        var fetchRequest: NSFetchRequest = NSFetchRequest(entityName: entityName)
////        fetchRequest.fetchLimit = 1
////        fetchRequest.sortDescriptors = NSArray(object: NSSortDescriptor(key: attribute, ascending: false)) as? [NSSortDescriptor]
////        var error: NSError? = nil
////        var objNSManagedObject: NSManagedObject = self.managedObjectContext().executeFetchRequest(fetchRequest, error: &error).lastObject
////        
////        if objNSManagedObject {
////            return objNSManagedObject.valueForKey(attribute).intValue()
////        }
////        return 0
////    }
//    
//    class func isManagedObjectAlreadyExist(entityName: String, withPredicate filter: NSPredicate) -> AnyObject {
//        return SampleStorageHelper.isManagedObjectAlreadyExist(entityName, withPredicate: filter, inContext: SampleStorageHelper.customManagedObjectContext)!
//    }
//    
//    class func isManagedObjectAlreadyExist(entityName: String, withPredicate filter: NSPredicate, inContext objContext: NSManagedObjectContext) -> AnyObject? {
//        let entity: NSEntityDescription = NSEntityDescription.entityForName(entityName, inManagedObjectContext: customManagedObjectContext)!
//        let fetchRequest: NSFetchRequest = NSFetchRequest()
//        fetchRequest.entity = entity
//        fetchRequest.fetchLimit = 1
//        fetchRequest.predicate = filter
//        
//        do {
//            let results = try customManagedObjectContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
//            return results.last!
//        } catch let error as NSError {
//            print("Error in Getting Core-Data Record: \(error.localizedDescription)")
//            return nil
//        }
//    }
//    
//    class func fetchWithPredicate(filter: NSPredicate?, sortDescriptor sortDescriptors: [NSSortDescriptor]?,  limit: Int, resultType: NSFetchRequestResultType, fetchProperties: [AnyObject]?,  distinct: Bool) -> [AnyObject]? {
//        let entityName: String = "\(self)"
//        let fetchRequest: NSFetchRequest = NSFetchRequest()
//        let entity: NSEntityDescription = NSEntityDescription.entityForName(entityName, inManagedObjectContext: customManagedObjectContext)!
//        fetchRequest.fetchBatchSize = 30
//        fetchRequest.entity = entity
//        fetchRequest.resultType = resultType
//        fetchRequest.propertiesToFetch = fetchProperties
//        fetchRequest.returnsDistinctResults = distinct
//        if filter != nil {
//            fetchRequest.predicate = filter
//        }
//        if sortDescriptors != nil {
//            fetchRequest.sortDescriptors = sortDescriptors
//        }
//        if limit > 0 {
//            fetchRequest.fetchLimit = limit
//        }
//        do {
//            let results = try customManagedObjectContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
//            return results
//        } catch let error as NSError {
//            print("Error in Getting Core-Data Record: \(error.localizedDescription)")
//            return nil
//        }
//    }
//    
//    /**
//     *  Manual Migration
//     */
//    class func iterativeMigrateURL(sourceStoreURL: NSURL, ofType sourceStoreType: String, toModel finalModel: NSManagedObjectModel, orderedModelNames modelNames: [AnyObject], error: NSError) -> Bool {
//        // If the persistent store does not exist at the given URL,
//        // assume that it hasn't yet been created and return success immediately.
//        if false == NSFileManager.defaultManager().fileExistsAtPath(sourceStoreURL.path!) {
//            return true
//        }
//        // Get the persistent store's metadata.  The metadata is used to
//        // get information about the store's managed object model.
//        let sourceMetadata: [String : AnyObject]? = self.metadataForPersistentStoreOfType(sourceStoreType, URL: sourceStoreURL, error: error)
//        if nil == sourceMetadata {
//            return false
//        }
//        // Check whether the final model is already compatible with the store.
//        // If it is, no migration is necessary.
//        if finalModel.isConfiguration(nil, compatibleWithStoreMetadata: sourceMetadata!) {
//            return true
//        }
//        // Find the current model used by the store.
//        let sourceModel = self.modelForStoreMetadata(sourceMetadata!, error: nil)!
//        
////        if sourceModel {
////            return false
////        }
//        // Get NSManagedObjectModels for each of the model names given.
//        let models: [AnyObject] = self.modelsNamed(modelNames, error: error)!
//        if models.count == 0 {
//            return false
//        }
//        // Build an inclusive list of models between the source and final models.
//        var relevantModels: NSMutableArray = NSMutableArray()
//        var firstFound: Bool = false
//        var lastFound: Bool = false
//        var reverse: Bool = false
//        for model in models {
//            if model.isEqual(sourceModel) || model.isEqual(finalModel) {
//                if firstFound {
//                    lastFound = true
//                    // In case a reverse migration is being performed (descending through the
//                    // ordered array of models), check whether the source model is found
//                    // after the final model.
//                    reverse = model.isEqual(sourceModel)
//                } else {
//                    firstFound = true
//                    
//                }
//            }
//            if firstFound {
//                relevantModels.addObject(model)
//            }
//            if lastFound {
//                break
//            }
//        }
//        // Ensure that the source model is at the start of the list.
//        if reverse {
//            relevantModels = NSMutableArray(array : relevantModels.reverseObjectEnumerator().allObjects)
//                //reverseObjectEnumerator().allObjects as! NSMutableArray
//        }
//        // Migrate through the list
//        for i in 0..<(relevantModels.count-1) {
//            let modelA: NSManagedObjectModel = relevantModels[i] as! NSManagedObjectModel
//            let modelB: NSManagedObjectModel = relevantModels[(i+1)] as! NSManagedObjectModel
//            // Check whether a custom mapping model exists.
////            var mappingModel: NSMappingModel = NSMappingModel.mappingModelFromBundles(nil, forSourceModel: modelA, destinationModel: modelB)!
//            var mappingModel = NSMappingModel.init(fromBundles: nil, forSourceModel: modelA, destinationModel: modelB)
//            // If there is no custom mapping model, try to infer one.
//            if nil == mappingModel {
//                do{
//                    mappingModel = try NSMappingModel.inferredMappingModelForSourceModel(modelA, destinationModel: modelB)
//                }
//                catch{
//                    return false
//                }
//            }
//            if !self.migrateURL(sourceStoreURL, ofType: sourceStoreType, fromModel: modelA, toModel: modelB, mappingModel: mappingModel!, error: error) {
//                return false
//            }
//        }
//        return true
//    }
//    
//    class func migrateURL(sourceStoreURL: NSURL, ofType sourceStoreType: String, fromModel sourceModel: NSManagedObjectModel, toModel targetModel: NSManagedObjectModel, mappingModel: NSMappingModel, error: NSError) -> Bool {
//        // Build a temporary path to write the migrated store.
//        let tempDestinationStoreURL: NSURL = NSURL.fileURLWithPath((sourceStoreURL.path! as NSString).stringByAppendingPathExtension("tmp")!)
//        // Migrate from the source model to the target model using the mapping,
//        // and store the resulting data at the temporary path.
//        let migrator: NSMigrationManager = NSMigrationManager(sourceModel: sourceModel, destinationModel: targetModel)
//        do{
//            try migrator.migrateStoreFromURL(sourceStoreURL, type: sourceStoreType, options: nil, withMappingModel: mappingModel, toDestinationURL: tempDestinationStoreURL, destinationType: sourceStoreType, destinationOptions: nil)
//        }
//        catch{
//            return false
//        }
//        
//        
//        // Move the original source store to a backup location.
//        let backupPath: String = (sourceStoreURL.path! as NSString).stringByAppendingPathExtension("bak")!
//        let fileManager: NSFileManager = NSFileManager.defaultManager()
//        do{
//            try fileManager.moveItemAtPath(sourceStoreURL.path!, toPath: backupPath)
//        }
//        catch{
//            return false
//        }
//        
//        // Move the destination store to the original source location.
//        do{
//            try fileManager.moveItemAtPath(tempDestinationStoreURL.path!, toPath: sourceStoreURL.path!)
//            try! fileManager.removeItemAtPath(backupPath)
//        }
//        catch{
//            try! fileManager.moveItemAtPath(backupPath, toPath: sourceStoreURL.path!)
//            return false
//        }
//        
//        return true
//    }
//    
//    class func errorDomain() -> String {
//        return "com.test.tmp.SampleProject"
//    }
//    
//    // MARK: - Private methods
//    // Returns an NSError with the give code and localized description,
//    // and this class' error domain.
//    class func errorWithCode(code: Int, description: String) -> NSError {
//        let userInfo: [NSObject : AnyObject] = [NSLocalizedDescriptionKey:description]
//        return NSError(domain: SampleStorageHelper.errorDomain(), code: code, userInfo: userInfo)
////        return false
//    }
//    
//    // Gets the metadata for the given persistent store.
//    class func metadataForPersistentStoreOfType(storeType: String, URL url: NSURL, error: NSError) -> [String : AnyObject]?  {
//        do{
//            let sourceMetadata = try NSPersistentStoreCoordinator.metadataForPersistentStoreOfType(storeType, URL: url, options: nil)
//            return sourceMetadata
//        }
//        catch{
//            return nil
//        }
//    }
//    
//    // Finds the source model for the store described by the given metadata.
//    class func modelForStoreMetadata(metadata: [String : AnyObject], error: NSError?) -> NSManagedObjectModel? {
//        if let sourceModel: NSManagedObjectModel = NSManagedObjectModel.mergedModelFromBundles(nil, forStoreMetadata: metadata)!{
//            if error == nil {
//                return sourceModel
//            }
//        }
//        
//        return nil
//    }
//    
//    // Returns an array of NSManagedObjectModels loaded from mom files with the given names.
//    // Returns nil if any model files could not be found.
//    class func modelsNamed(modelNames: [AnyObject], error: NSError?) -> [AnyObject]? {
//        let models: NSMutableArray = NSMutableArray()
//        for modelName in modelNames {
//            let modelUrl: NSURL = self.urlForModelName(modelName as! String, inDirectory: nil)
//            let model: NSManagedObjectModel? = NSManagedObjectModel(contentsOfURL: modelUrl)!
//            if model == nil {
//                if nil != error {
////                    var errorDesc: String = "No model found for \(modelName) at URL \(modelUrl)"
////                    *error = self.errorWithCode(110, description: errorDesc)
//                }
//                return nil
//            }
//            models.addObject(model!)
//        }
//        return models as [AnyObject]
//    }
//    
//    // Returns an array of paths to .mom model files in the given directory.
//    // Recurses into .momd directories to look for .mom files.
//    // - param: directory The name of the bundle directory to search.  If nil,
//    //    searches default paths.
//    class func modelPathsInDirectory(directory: String) -> [AnyObject] {
//        var modelPaths = [String]()
//        // Get top level mom file paths.
//        modelPaths = NSBundle.mainBundle().pathsForResourcesOfType("mom", inDirectory: directory)
//        // Get mom file paths from momd directories.
//        let momdPaths: [AnyObject] = NSBundle.mainBundle().pathsForResourcesOfType("momd", inDirectory: directory)
//        for momdPath in momdPaths {
//            let resourceSubpath: String = (momdPath as! NSString).lastPathComponent
//             modelPaths.appendContentsOf(NSBundle.mainBundle().pathsForResourcesOfType("mom", inDirectory: resourceSubpath))
//        }
//        return modelPaths
//    }
//    
//    // Returns the URL for a model file with the given name in the given directory.
//    // - param: directory The name of the bundle directory to search.  If nil,
//    //    searches default paths.
//    class func urlForModelName(modelName: String, inDirectory directory: String?) -> NSURL {
//        let bundle: NSBundle = NSBundle.mainBundle()
//        var url: NSURL? = bundle.URLForResource(modelName, withExtension: "mom", subdirectory: directory)!
//        if nil == url {
//            // Get mom file paths from momd directories.
//            let momdPaths: [AnyObject] = NSBundle.mainBundle().pathsForResourcesOfType("momd", inDirectory: directory)
//            for momdPath in momdPaths {
//                url = bundle.URLForResource(modelName, withExtension: "mom", subdirectory: (momdPath as! NSString).lastPathComponent)
//            }
//        }
//        return url!
//    }
//    
//}
