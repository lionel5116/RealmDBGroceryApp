//
//  AddShoppingListItemScreen.swift
//  RealmDBGroceryApp
//
//  Created by lionel jones on 8/17/22.
//

import SwiftUI
import RealmSwift

struct AddShoppingListItemScreen: View {
    
    @ObservedRealmObject var shoppingList: ShoppingList
    
    @State private var title = ""
    @State private var quantity = ""
    @State private var selectedCategory = ""
    
    @Environment(\.dismiss) var dismiss
    
    
    
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    let data = ["Poduce","Fruit","Meat","Condiments","Beverages","Snacks","Dairy","Electronics","Office"]
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(data, id: \.self) {
                        item in
                         Text(item)
                            .padding()
                            .frame(width:130)
                            .background(selectedCategory == item ? .orange : .green)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0,style: .continuous))
                            .foregroundColor(.white)
                            .onTapGesture {
                                selectedCategory = item
                            }
                    }//ForEach
                }
                Spacer().frame(height: 60)
                TextField("Title", text:$title).textFieldStyle(.roundedBorder)
                TextField("Quantity", text:$quantity).textFieldStyle(.roundedBorder)
            
                Button {
                    //save the item
                    let shoppingItem = ShoppingListItem();
                    shoppingItem.title = title
                    shoppingItem.quantity = Int(quantity) ?? 1
                    shoppingItem.category = selectedCategory
                    
                    //make sure to include the $ or you will get a
                    //'RLMException', reason: 'Cannot modify managed RLMArray outside of a write transaction.' 
                    $shoppingList.items.append(shoppingItem)
                    dismiss()
              
                    
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity, maxHeight: 40)
                }.buttonStyle(.bordered).padding(.top, 20)
                Spacer()
                
                    .navigationTitle("Add Item")
                
            }.padding()  //padding for the VStacl
        }
    }
}

struct AddShoppingListItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingListItemScreen(shoppingList: ShoppingList())
    }
}
