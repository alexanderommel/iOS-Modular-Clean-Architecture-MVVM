//
//  ShoppingCartScreen.swift
//  checkout-ui
//
//  Created by Rommel Valdiviezo on 25/7/24.
//

import SwiftUI
import stores
import checkout

struct ShoppingCartScreen: View {
    
    let cart: ShoppingCart
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(cart.store.name)
                .font(.title)
                .fontWeight(.semibold)
                .padding(20)
            List{
                ForEach(cart.items){ it in
                    LineItemView(item: it)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.inset)
            .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    return ShoppingCartScreen(cart: shopping_carts[0])
}
