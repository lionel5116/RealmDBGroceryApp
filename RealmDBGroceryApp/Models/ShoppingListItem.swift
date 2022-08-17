//
//  ShoppingListItem.swift
//  RealmDBGroceryApp
//
//  Created by lionel jones on 8/17/22.
//

import Foundation
import RealmSwift

class ShoppingListItem: Object, Identifiable {
    
    //Persisted means that this property will be allowed to persist in Realm Storage
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var quantity: Int
    @Persisted var category: String
    
    override class func primaryKey() -> String? {
        "id"
    }
    
}
