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
    
    @Environment(StoresViewModel.self) var vm
    
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
                
                if vm.errorLocalized.isEmpty{
                    ForEach(vm.stores) { store in
                        NavigationLink
                        {
                            CatalogueScreen(store: store, catalogue: catalog)
                        } label: {
                            StoreView(store: store)
                        }
                        
                    }
                }else{
                    let errorMessage = NSLocalizedString(vm.errorLocalized, bundle: Bundle.fromCommonFramework, comment: "")
                    Text("Error: \(errorMessage)")
                }
                
                
            }
            .navigationTitle("Restaurants")
            .listStyle(.plain)
        }
        
        
    }
}

#Preview {
    
    var apiInteractor:StoresApiInteractor = StoresApiInteractorFaker1()
    
    @State var storesViewModel = StoresViewModel(api: apiInteractor)
    
    return StoresScreen(categories: restaurant_categories, stores: stors)
        .environment(storesViewModel)
}
