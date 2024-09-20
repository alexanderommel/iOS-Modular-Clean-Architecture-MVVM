//
//  CatalogueCategoryRowView.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import SwiftUI
import domain
import test_resources

struct CatalogueCategoryRowView: View {
    
    var categories: [ProductCategory]
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Categories")
                .foregroundStyle(.black)
                .fontWeight(.bold)
                .font(.headline)
                .padding(.top, 4)
            
            Text("We've got \(categories.count) categories for you!")
                .foregroundStyle(Color.myText12Color)
                .fontWeight(.medium)
                .font(.caption)
            
            ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 8) {
                                ForEach(categories) { category in
                                    CatalogueProductCategoryView(category: category)
                                }
                            }
                        }
                        .frame(height: 15)
                        .padding(.top, 2)
        }
    }
}

#Preview {
    CatalogueCategoryRowView(categories: product_categories)
}
