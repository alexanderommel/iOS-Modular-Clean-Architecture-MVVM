//
//  dandelionApp.swift
//  dandelion
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import SwiftUI
import stores_ui
import stores
import checkout
import networking
import routing
import user
import common
import persistence

@main
struct dandelionApp: App {
        
    
    @StateObject var router = NavigationRouter()
    
    

    @StateObject var storesViewModel = StoresViewModel(api: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()),
                                        checkout_api: CheckoutApiInteractorImpl(storeApi: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()), userApi: UserApiInteractorFaker(), checkoutLocalRepo: CheckoutLocalRepositoryImpl(context: AppDatabase.preview.container.newBackgroundContext()))
    )
    
    
    
    @StateObject var catalogueViewModel = CatalogueViewModel(api: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()))
    
    
    
    @StateObject var productViewModel = ProductViewModel(api: CheckoutApiInteractorImpl(storeApi: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()), userApi: UserApiInteractorFaker(), checkoutLocalRepo: CheckoutLocalRepositoryImpl(context: AppDatabase.preview.container.newBackgroundContext())))
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(storesViewModel)
                .environmentObject(catalogueViewModel)
                .environmentObject(productViewModel)
                .environmentObject(router)
                .environment(\.managedObjectContext,AppDatabase.preview.container.viewContext)
            
        }
    }
}
