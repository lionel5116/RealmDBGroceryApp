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
    @State private var selectedItemIds: [ObjectId] = []
    @State private var selectedCategory: String = "All"
    
    var items: [ShoppingListItem] {
        if(selectedCategory == "All") {
            return Array(shoppingList.items)
        } else {
            return shoppingList.items.sorted(byKeyPath: "title")
                .filter {$0.category == selectedCategory }
        }
    }
    
    var body: some View {
        VStack {
              
            VStack {
                
                CategoryFilterView(selectedCategory: $selectedCategory)
                    .padding()
                
                if items.isEmpty {
                    Text("No items found")
                }
                
                
                List {
                    ForEach(items) {
                        item in
                     
                        NavigationLink {
                            AddShoppingListItemScreen(shoppingList: shoppingList, itemToEdit: item)
                        } label: {
                            ShoppingItemCell(item: item, selected:
                                selectedItemIds.contains(item.id)) {
                                   selected in
                                if selected {
                                    selectedItemIds.append(item.id)
                                    if let indexToDelete = shoppingList.items.firstIndex(where: {$0.id == item.id}) {
                                        //delete the item
                                        $shoppingList.items.remove(at: indexToDelete)
                                    } //if let indexToDelete
                                }//if selected
                            }//selectedItemIds.contains
                        }
                        
                    
                    }.onDelete(perform: $shoppingList.items.remove) //ForEach
                }//List
            }//VStack
            
            .navigationTitle(shoppingList.title)
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
