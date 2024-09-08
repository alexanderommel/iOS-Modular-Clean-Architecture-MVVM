//
//  ShoppingCartScreen.swift
//  checkout-ui
//
//  Created by Rommel Valdiviezo on 25/7/24.
//

import SwiftUI
import stores
import checkout
import routing

public struct ShoppingCartScreen: View {
    
    @EnvironmentObject var router: NavigationRouter
    
    let cart: Checkout
    
    @State var request_utensils: Bool = false
    
    public init(cart: Checkout){
        self.cart = cart
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            

            List{
                ForEach(cart.shoppingCart.items){ it in
                    LineItemView(item: it)
                        .listRowSeparator(.hidden)
                }
                
                HStack{
                    Spacer()
                    Button{
                        
                    } label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("Add items")
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                    }
                    .background(Color.myPrimarySurfaceGrayColor)
                    .clipShape(.rect(cornerRadius: 18))
                }
                .listRowSeparator(.hidden)
                
                Rectangle()
                    .listRowInsets(EdgeInsets())
                    .frame(width: .infinity, height: 5)
                    .foregroundStyle(Color(hue: 1.0, saturation: 0.0, brightness: 0.943))
                    .listRowSeparator(.hidden)
                
                HStack{
                    Image(systemName: "fork.knife")
                    Text("Request utensils")
                        .fontWeight(.semibold)
                        .padding(.vertical, 8)
                    Spacer()
                    Toggle(isOn: $request_utensils) {
                            }
                            .toggleStyle(.switch)

                }.padding(.top,2)
                
                HStack{
                    Image(systemName: "doc.plaintext.fill")
                    Text("Add note")
                        .fontWeight(.semibold)
                        .padding(.vertical, 8)
                    Spacer()
                    Image(systemName: "chevron.right")
                }.padding(.top, 4)
                    .listRowSeparator(.visible)
                
                HStack{
                    Text("Subtotal")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(cart.shoppingCart.total_amount.formatedAmount)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding(.top, 16)
                .listRowSeparator(.hidden)
                .navigationTitle(cart.store.name)
                
            }
            .listStyle(.inset)
            .listRowSeparator(.hidden)
            
            Button{
                router.navigate(to: .checkoutScreen(checkout: cart))
            }label: {
                Text("Go to checkout")
                    .font(.body)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(20)
            }.padding(.horizontal,20)
            
        }
    }
}

#Preview {
    @StateObject var router = NavigationRouter()
    return ShoppingCartScreen(cart: checkout1)
        .environmentObject(router)
}
