//
//  RealmManager.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import RealmSwift

let uiRealm = try! Realm()

class RealmManager: NSObject {
    static let sharedInstance = RealmManager()
    func getAllDataForObject(_ T : Object.Type) -> [Object] {
        
        var objects = [Object]()
        for result in uiRealm.objects(T) {
            objects.append(result)
        }
        return objects
    }
    
    func getAllDataForObject(_ T : Object.Type,query :String) -> [Object] {
        var objects = [Object]()
        
        for result in uiRealm.objects(T).filter(query) {
            objects.append(result)
        }
        return objects
       
    }
    
    func deleteAllDataForObject(_ T : Object.Type) {
        self.delete(self.getAllDataForObject(T))
    }
    
    func replaceAllDataForObject(_ T : Object.Type, with objects : [Object]) {
        deleteAllDataForObject(T)
        add(objects)
    }
    
    func add(_ objects : [Object], completion : @escaping() -> ()) {
        
        try! uiRealm.write{
            
            uiRealm.add(objects)
            completion()
        }
    }
    
    func add(_ objects : [Object]) {
        
        try! uiRealm.write{
            
            uiRealm.add(objects)
        }
    }
    
    func update(_ block: @escaping ()->Void) {
        
        try! uiRealm.write(block)
        
    }
    
    func delete(_ objects : [Object]) {
        
        try! uiRealm.write{
            uiRealm.delete(objects)
        }
    }
    
    func configureMigration() {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you’ve never set a schema version before, the version is 0).
            schemaVersion: 1,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })
        
        Realm.Configuration.defaultConfiguration = config
    }
    
}
