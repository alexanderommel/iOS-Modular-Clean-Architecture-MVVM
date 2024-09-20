//
//  LineItemView.swift
//  checkout-ui
//
//  Created by Rommel Valdiviezo on 25/7/24.
//

import SwiftUI
import domain
import test_resources

struct LineItemView: View {
    
    let item: LineItem
    
    var body: some View {
        VStack{
            HStack{
                Image(uiImage: loadImageFromAssets(name: item.product.imageUrl))
                    .resizable()
                    .frame(maxWidth: 62, maxHeight: 62)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 4))
                
                
                
                VStack(alignment: .leading){
                    Text(item.product.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                    HStack{
                        Text("(Added \(item.quantity))")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.myText34Color)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(maxWidth: 8, maxHeight: 8)
                            .foregroundStyle(.gray)
                        Text(item.total_amount.formatedAmount)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.myPrimaryColor)
                    }
                }
                .padding(.leading, 8)
                Spacer()
                Image(systemName: "trash.circle.fill")
                    .resizable()
                    .frame(maxWidth: 32, maxHeight: 32)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color.black)
            }
        }
    }
}

#Preview {
    return LineItemView(item: shopping_carts[0].items[0])
}
