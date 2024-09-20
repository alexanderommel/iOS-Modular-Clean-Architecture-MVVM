//
//  StoreView.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import SwiftUI
import test_resources
import domain

struct StoreView: View {
    
    var store: Store
    
    var body: some View {
        Group{
            VStack(alignment: .leading){
                Image(uiImage: loadImageFromAssets(name: store.storeImage))
                    .resizable()
                    .frame(width: .infinity, height: 120)
                    .clipShape(.rect(cornerRadius: 12))
                HStack{
                    Text(store.name)
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                    Spacer()
                    Text(store.deliveryTime)
                        .foregroundStyle(Color.myText34Color)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                }
                HStack {
                    Text("Shipping fee: \(store.deliveryFee)")
                        .foregroundStyle(Color.myText34Color)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    Text("$")
                        .foregroundStyle(Color.myPrimaryColor)
                }
            }
                .padding(.vertical, 10)
        }
            .background(Color.white)
    }
}

#Preview {
    StoreView(store: stors[1])
}
