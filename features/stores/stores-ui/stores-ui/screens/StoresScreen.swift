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
                    Text("¡Hola Alexander!")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                }
                .listRowSeparator(.hidden)

                Text("Mira lo que tenemos para ti.")
                    .foregroundStyle(Color.myText34Color)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                
                LocationView()
                    .padding(.top, 2)
                    .listRowSeparator(.hidden)
                
                StoreCategoryRowView(categories: categories)
                    .listRowSeparator(.hidden)
                
                Text("Restaurantes disponibles")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .font(.headline)
                    .padding(.top, 4)
                    .listRowSeparator(.hidden)
                
                ForEach(stores) { store in
                    NavigationLink
                    {
                    } label: {
                        StoreView(store: store)
                    }
                    
                }
            }
            .navigationTitle("Restaurantes")
            .listStyle(.plain)
        }
        
        
    }
}

#Preview {
    StoresScreen(categories: restaurant_categories, stores: stors)
}
