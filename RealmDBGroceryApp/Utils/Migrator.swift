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
        let config = Realm.Configuration(schemaVersion:1) {
            migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                //add new fields
                migration.enumerateObjects(ofType: ShoppingList.className()) { _, newObject in
                  newObject!["items"] = List<ShoppingListItem>()
                }
            }
        }
        
        Realm.Configuration.defaultConfiguration = config
        let _ = try!Realm()
    }
}
