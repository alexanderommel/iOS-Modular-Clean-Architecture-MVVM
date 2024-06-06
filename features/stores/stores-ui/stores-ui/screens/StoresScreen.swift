//
//  StoresScreen.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import SwiftUI
import stores
import ui_dandelion
import common

public struct StoresScreen: View {
    
    @EnvironmentObject var vm: StoresViewModel
    
    private var categories: [StoreCategory] = restaurant_categories
    
    
    public init() {
    }
    
    public var body: some View {
        
        
        
        NavigationStack{
            
            if vm.isLoading {
                ScreenLoadingView()
            }else{
                
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
            
            
            
        }.onAppear(){
            print("ContentView appeared!")
            vm.fetchStoresData()
        }
        
        
    }
}

#Preview {
    
    var apiInteractor:StoresApiInteractor = StoresApiInteractorFaker1()
    
    @StateObject var storesViewModel = StoresViewModel(api: apiInteractor)
    
    return StoresScreen()
        .environmentObject(storesViewModel)
}
