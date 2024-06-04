//
//  StoreCategoryView.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import SwiftUI
import stores

struct StoreCategoryView: View {
    
    var category: StoreCategory
    
    var body: some View {
        VStack{
            Group{
                Image(uiImage: loadImageFromAssets(name: category.imageName))
                    .resizable()
                    .frame(width: 24,height: 24)
                    .padding(10)
            }
            .background(Color.white)
            .cornerRadius(124.0)
            .shadow(color: Color(hue: 1.0, saturation: 0.027, brightness: 0.829),radius: 1)
            Text(category.name)
                .padding(.top, 4)
                .fontWeight(.medium)
                .font(.caption)
        }
    }
}

#Preview {
    StoreCategoryView(category: restaurant_categories[2])
}
