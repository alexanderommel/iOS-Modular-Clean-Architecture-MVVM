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
                Image(systemName: "star")
                    .resizable()
                    .frame(maxWidth: 48, maxHeight: 48)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
                VStack(alignment: .leading){
                    Text("Sal, Pimienta y Hambrienta")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    HStack{
                        Text("2 items")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.myText12Color)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(maxWidth: 8, maxHeight: 8)
                        Text("$5.50")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.myText12Color)
                    }
                }
                .padding(.leading, 8)
                Spacer()
                Image(systemName: "trash.circle.fill")
                    .resizable()
                    .frame(maxWidth: 32, maxHeight: 32)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
                    .foregroundStyle(.red)
            }
            .padding(10)
            
        }
    }
}

#Preview {
    ShoppingCartView()
}
