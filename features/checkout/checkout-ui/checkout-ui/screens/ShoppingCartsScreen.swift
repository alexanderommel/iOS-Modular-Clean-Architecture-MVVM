//
//  ShoppingCartsScreen.swift
//  checkout-ui
//
//  Created by Rommel Valdiviezo on 25/7/24.
//

import SwiftUI
import domain
import core_ios
import test_resources


public struct ShoppingCartsScreen: View {
    
    @EnvironmentObject var router: NavigationRouter
    
    let carts: [Checkout]

    public init(carts: [Checkout]) {
        self.carts = carts
    }
    
    public var body: some View {
        List{
            VStack(alignment: .leading) {
                
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
                .listRowSeparator(.hidden)

                
                Rectangle()
                    .listRowInsets(EdgeInsets())
                    .frame(width: .infinity, height: 1.2)
                    .foregroundStyle(Color(hue: 1.0, saturation: 0.0, brightness: 0.943))
                    .padding(.top, 10)
                
                HStack{
                    Spacer()
                }
                
            }
            .listRowSeparator(.hidden)
            
            ForEach(carts){ checkout in
                Button{
                    router.navigate(to: .shoppingCartScreen(checkout: checkout))
                }label: {
                    ShoppingCartView(checkout: checkout)
                        .padding(.top, 5)
                }
            }.listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)
        .navigationTitle("Shopping Carts")
    
    
    Button{
        
    }label: {
        Text("Delete shopping carts")
            .font(.body)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .foregroundColor(Color.black)
            .background(Color.myPrimarySurfaceGrayColor)
            .cornerRadius(20)
    }.padding(.horizontal,20)
    }
}

#Preview {
    @Previewable @StateObject var router = NavigationRouter()
    return ShoppingCartsScreen(carts: checkouts_data)
        .environmentObject(router)
}
