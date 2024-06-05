//
//  StoresScreen.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import SwiftUI
import stores
import common

struct StoresScreen: View {
    
    var categories: [StoreCategory]
    var stores: [Store]
    
    var locc = Location(address: "asd", latitude: "", longitude: "")
    
    var body: some View {
        
        NavigationStack{
            List{
                HStack{
                    Text("¡Hi Alexander!")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                }
                .listRowSeparator(.hidden)

                Text("Look what we've got for you!")
                    .foregroundStyle(Color.myText34Color)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                
                LocationView()
                    .padding(.top, 2)
                    .listRowSeparator(.hidden)
                
                StoreCategoryRowView(categories: categories)
                    .listRowSeparator(.hidden)
                
                Text("Restaurants near you")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .font(.headline)
                    .padding(.top, 4)
                    .listRowSeparator(.hidden)
                
                ForEach(stores) { store in
                    NavigationLink
                    {
                        CatalogueScreen(store: store, catalogue: catalog)
                    } label: {
                        StoreView(store: store)
                    }
                    
                }
            }
            .navigationTitle("Restaurants")
            .listStyle(.plain)
        }
        
        
    }
}

#Preview {
    StoresScreen(categories: restaurant_categories, stores: stors)
}
