//
//  ShoppingListItemsScreen.swift
//  RealmDBGroceryApp
//
//  Created by lionel jones on 8/17/22.
//

import SwiftUI
import RealmSwift

struct ShoppingListItemsScreen: View {
    
   //Make sure have this is as "ObservedRealmObject and not ObservedObject or you will get an Frozen Error
   @ObservedRealmObject var shoppingList: ShoppingList
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("Items")
            
                .navigationTitle("Location")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }//toolbar
        .sheet(isPresented: $isPresented) {
            AddShoppingListItemScreen(shoppingList: shoppingList)
        }
    }
}

/*
struct ShoppingListItemsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShoppingListItemsScreen(shoppingList: ShoppingList())
        }
        
    }
}
 */
