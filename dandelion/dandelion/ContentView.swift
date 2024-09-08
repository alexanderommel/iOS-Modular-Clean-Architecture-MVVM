//
//  ContentView.swift
//  dandelion
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import SwiftUI
import stores_ui
import networking
import common
import stores
import user
import persistence

import routing

import checkout

struct ContentView: View {
    
    @EnvironmentObject var router: NavigationRouter
    
    
    var body: some View {
        NavigationStack(path: $router.navPath){
            StoresScreen(user: test_user)
                .setUpNav()
        }
        
    }
}

#Preview {
    
    @StateObject var router = NavigationRouter()
    
    let context = AppDatabase.preview.container.newBackgroundContext()
    
    
    @StateObject var storesViewModel = StoresViewModel(api: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()),
                                        checkout_api: CheckoutApiInteractorImpl(storeApi: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()), userApi: UserApiInteractorFaker(), checkoutLocalRepo: CheckoutLocalRepositoryImpl(context: AppDatabase.preview.container.newBackgroundContext()))
    )
    
    
    @StateObject var catalogueViewModel = CatalogueViewModel(api: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()))
    
    
    @StateObject var productViewModel = ProductViewModel(api: CheckoutApiInteractorImpl(storeApi: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()), userApi: UserApiInteractorFaker(), checkoutLocalRepo: CheckoutLocalRepositoryImpl(context: context)))
    
    return ContentView()
        .environmentObject(storesViewModel)
        .environmentObject(catalogueViewModel)
        .environmentObject(productViewModel)
        .environmentObject(router)
}
