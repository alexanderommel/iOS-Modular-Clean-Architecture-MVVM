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
import user
import checkout

public struct StoresScreen: View {
    
    @State private var toast: Toast? = nil
    @EnvironmentObject var vm: StoresViewModel
    @EnvironmentObject var vmProduct: ProductViewModel
    
    private var categories: [StoreCategory] = restaurant_categories
    
    func updateToastOnAddedProduct(){
        toast = Toast(style: .success, message: "Product added successfully", duration: 3.0, width: 400)
    }
    
    public init() {
    }
    
    public var body: some View {
        
        
        
        
        NavigationStack{
            
            if vm.isLoading {
                IndeterminateScreenLoadingView()
            }else{
                
                if vmProduct.itemAdded{
                    Text("")
                        .onAppear(){
                            updateToastOnAddedProduct()
                            vmProduct.itemAdded = false
                        }.hidden()
                }
                
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
                .listRowSeparator(.hidden)
                
                if !vm.shopping_carts.isEmpty {
                    Button{
                        
                    }label: {
                        HStack{
                            Image(systemName: "cart.fill")
                                .padding(.leading, 20)
                            Spacer()
                            Text("View shopping carts (\(vm.shopping_carts.count))")
                                .font(.body)
                                .fontWeight(.medium)
                                .padding(.vertical, 20)
                            Spacer()
                                
                        }
                        .background(Color.black)
                        .cornerRadius(20)
                        .foregroundColor(Color.white)
                        .padding(.top, 5)
                        
                        
                            
                    }.padding(.horizontal,20)
                        .listRowSeparator(.hidden)
                }
                
                
                
            }
            
            
        }.onAppear(){
            print("ContentView appeared!")
            vm.fetchStoresData()
        }
        .toastView(toast: $toast)
        
        
    }
}

#Preview {
    
    
    @StateObject var storesViewModel = StoresViewModel(api: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()), checkout_api: CheckoutApiInteractorFaker1())
    @StateObject var catalogueViewModel = CatalogueViewModel(api: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()))
    @StateObject var productViewModel = ProductViewModel(api: CheckoutApiInteractorFaker1())
    
    return StoresScreen()
        .environmentObject(storesViewModel)
        .environmentObject(catalogueViewModel)
        .environmentObject(productViewModel)
}
