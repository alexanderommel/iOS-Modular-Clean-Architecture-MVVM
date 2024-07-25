//
//  ShoppingCartsScreen.swift
//  checkout-ui
//
//  Created by Rommel Valdiviezo on 25/7/24.
//

import SwiftUI
import checkout


struct ShoppingCartsScreen: View {
    
    let carts: [ShoppingCart]

    
    var body: some View {
        VStack {
            List{
                VStack(alignment: .leading) {
                    Text("Carts")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Group{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Shopping Carts")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("If you wait too long for finishing a cart, the prices might have changed.")
                                    .fontWeight(.medium)
                                    .font(.caption)
                                    .padding(.top, 0.5)
                                
                                
                            }
                            
                            Spacer()
                            Image(systemName: "cart.fill")
                                .resizable()
                                .frame(width: 36, height: 28)
                                .foregroundStyle(Color.myPrimaryColor)
                        }
                        .padding(.vertical, 14)
                        .padding(.horizontal, 16)
                    }
                    .background(Color.white)
                    .cornerRadius(10.0)
                    .shadow(color: Color(hue: 1.0, saturation: 0.027, brightness: 0.829),radius: 1)

                    
                    Rectangle()
                        .listRowInsets(EdgeInsets())
                        .frame(width: .infinity, height: 1.2)
                        .foregroundStyle(Color(hue: 1.0, saturation: 0.0, brightness: 0.943))
                        .padding(.top, 10)
                    
                    HStack{
                        Spacer()
                    }
                    
                }
                
                ForEach(carts){ cart in
                    ShoppingCartView()
                        .padding(.top, 10)
                        .listRowSeparator(.hidden)
                }.listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        .listRowSeparator(.hidden)
        }
        
        Button{
            
        }label: {
            Text("Delete shopping carts")
                .font(.body)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .foregroundColor(Color.white)
                .background(Color.red)
                .cornerRadius(20)
        }.padding(.horizontal,20)
    }
}

#Preview {
    return ShoppingCartsScreen(carts: shopping_carts)
}
