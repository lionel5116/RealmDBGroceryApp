//
//  Migrator.swift
//  RealmDBGroceryApp
//
//  Created by lionel jones on 8/17/22.
//

import Foundation
import RealmSwift

class Migrator {
    init() {
        updateSchema()
    }
    
    func updateSchema() {
        //make sure you always change the schemaVersion (bump it by one for each new migration you add
        let config = Realm.Configuration(schemaVersion: 2) {
            migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                //add new fields
                migration.enumerateObjects(ofType: ShoppingList.className()) { _, newObject in
                  newObject!["items"] = List<ShoppingListItem>()
                }
            }
            
            if oldSchemaVersion < 2 {
                //add new fields
                migration.enumerateObjects(ofType: ShoppingListItem.className()) { _, newObject in
                  newObject!["category"] = ""
                }
            }
            
            
            
        }
        
        Realm.Configuration.defaultConfiguration = config
        let _ = try!Realm()
    }
}
