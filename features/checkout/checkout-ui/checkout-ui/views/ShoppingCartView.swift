//
//  ShoppingCartView.swift
//  checkout-ui
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import SwiftUI
import ui_dandelion

struct ShoppingCartView: View {
    var body: some View {
        VStack{
            HStack{
                Image(uiImage: loadImageFromAssets(name: "store1"))
                    .resizable()
                    .frame(maxWidth: 62, maxHeight: 62)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
                VStack(alignment: .leading){
                    Text("Sal, Pimienta y Hambrienta")
                        .font(.headline)
                        .fontWeight(.semibold)
                    HStack{
                        Text("2 items")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.myText34Color)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(maxWidth: 8, maxHeight: 8)
                        Text("$5.50")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.myText34Color)
                    }
                }
                .padding(.leading, 8)
                Spacer()
                Image(systemName: "trash.circle.fill")
                    .resizable()
                    .frame(maxWidth: 32, maxHeight: 32)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
                    .foregroundStyle(.black)
            }
            .padding(14)
            
            Button(
                action: {
                    

                }, label: {
                    
                    Text("View cart")
                        .font(.body)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(10)
                }
            ).padding(.horizontal, 14)
                .padding(.top, 2)
            
            Button(
                action: {
                    

                }, label: {
                    
                    Text("View store")
                        .font(.body)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .foregroundColor(Color.black)
                        .background(Color.myPrimarySurfaceGrayColor)
                        .cornerRadius(10)
                }
            ).padding(.horizontal, 14)
                .padding(.top, 0)
                .padding(.bottom, 14)
            
        }
        
        .background(Color.white)
        .cornerRadius(12.0)
        .shadow(color: Color(hue: 1.0, saturation: 0.027, brightness: 0.829),radius: 1)
        
    }
}

#Preview {
    ShoppingCartView()
}
