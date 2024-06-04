//
//  ProductView.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import SwiftUI
import stores

struct ProductView: View {
    
    var product: Product
    
    var body: some View {
        Group {
            HStack{
                VStack(alignment: .leading){
                    Text(product.name)
                        .fontWeight(.semibold)
                        .font(.caption)
                    Text(product.description)
                        .fontWeight(.medium)
                        .font(.caption2)
                        .foregroundStyle(Color.myText12Color)
                        .padding(.top, 1)
                    HStack{
                        Text("Price: ")
                            .fontWeight(.semibold)
                            .font(.caption)
                        Text(product.price.formatedAmount)
                            .fontWeight(.semibold)
                            .font(.caption)
                            .foregroundStyle(Color.myPrimaryColor)
                            .padding(.top, 1)
                    }
                }
                Spacer()
                Image(uiImage: loadImageFromAssets(name: product.imageUrl))
                    .resizable()
                    .frame(maxWidth: 64, maxHeight: 64)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 6))
                    
            }.fixedSize(horizontal: false, vertical: true)
        }
        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)

    }
}

#Preview {
    ProductView(product: products1[0])
}
