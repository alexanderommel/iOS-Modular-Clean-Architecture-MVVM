//
//  CatalogueProductCategoryView.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import SwiftUI
import domain
import test_resources

struct CatalogueProductCategoryView: View {
    
    var category: ProductCategory
    
    var body: some View {
        Group{
            Text(category.name)
                .foregroundStyle(Color.myPrimaryColor)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .fontWeight(.medium)
                .font(.caption)
        }
        .background(Color.myPrimarySurfaceColor)
        .cornerRadius(10.0)
        .padding(.vertical,8)
    }
}

#Preview {
    CatalogueProductCategoryView(category: product_categories[0])
}
