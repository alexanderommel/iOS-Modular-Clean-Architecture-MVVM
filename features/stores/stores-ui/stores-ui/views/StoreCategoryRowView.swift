//
//  StoreCategoryRowView.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import SwiftUI
import domain
import test_resources


struct StoreCategoryRowView: View {
    
    let categories: [StoreCategory]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Categories")
                .foregroundStyle(.black)
                .fontWeight(.bold)
                .font(.headline)
                .padding(.top, 4)
            
            ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 8) {
                                ForEach(categories) { category in
                                    StoreCategoryView(category: category)
                                }
                            }
                        }
                        .frame(height: 100)
        }
    }
}

#Preview {
    var cats: [StoreCategory] = restaurant_categories
    return StoreCategoryRowView(categories: cats)
}
