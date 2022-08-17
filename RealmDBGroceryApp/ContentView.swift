//
//  ContentView.swift
//  RealmDBGroceryApp
//
//  Created by lionel jones on 8/17/22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedResults(ShoppingList.self) var shoppingLists
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack{
                if shoppingLists.isEmpty {
                    Text("No Shopping lists")
                }
                
                List {
                    ForEach(shoppingLists, id: \.id) {
                        shoppingList in
                        
                        NavigationLink {
                            ShoppingListItemsScreen(shoppingList: shoppingList)
                        } label: {
                           
                            VStack(alignment: .leading) {
                                Text(shoppingList.title)
                                Text(shoppingList.address).opacity(0.4)
                            }
                        }
                        
                       
                    }.onDelete(perform: $shoppingLists.remove) //foreach
                }
                    .navigationTitle("RealmDB Grocery App")
                   
            } //VStack
            .sheet(isPresented: $isPresented, content: {
                AddShoppingListScreen()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }//toolbar
        }//Navigation View
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
