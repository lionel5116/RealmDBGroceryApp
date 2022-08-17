//
//  AddShoppingListScreen.swift
//  RealmDBGroceryApp
//
//  Created by lionel jones on 8/17/22.
//

import SwiftUI
import RealmSwift

struct AddShoppingListScreen: View {
    
    @State private var title: String = ""
    @State private var address: String = ""
    
    @ObservedResults(ShoppingList.self) var shoppingLists
    
    //dismissing the keyboard
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            
            Form {
                TextField("Enter title" , text: $title)
                TextField("Enter address" , text: $address)
                
                Button {
                    //create a shopping list record with realm
                    let shoppingList = ShoppingList()
                    shoppingList.title = title
                    shoppingList.address = address
                    //add your item to Realm Database
                    $shoppingLists.append(shoppingList)
                    
                    dismiss()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }.buttonStyle(.bordered)
            }
            .navigationTitle("New Shopping list")
        }
    }
}

struct AddShoppingListScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingListScreen()
    }
}
