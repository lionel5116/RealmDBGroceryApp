//
//  ShoppingItemCell.swift
//  RealmDBGroceryApp
//
//  Created by lionel jones on 8/17/22.
//

import SwiftUI

struct ShoppingItemCell: View {
    
    let item: ShoppingListItem
    var selected: Bool
    let isSelected: (Bool) -> Void
    
    
    
    var body: some View {
        HStack {
            Image(systemName: selected ? "checkmark.square": "square")
                .onTapGesture {
                    isSelected(!selected)
                }
            
            VStack (alignment: .leading){
                Text(item.title)
                Text(item.category)
                    .opacity(0.4)
            } //Vstack
            Spacer()
            Text("\(item.quantity)")
        }//HStack
        .opacity(selected ? 0.4 : 1.0)
        
    }
}

struct ShoppingItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingItemCell(
            item:ShoppingListItem(),
            selected:true,
            isSelected: {_ in})
    }
}
