//
//  dandelionApp.swift
//  dandelion
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import SwiftUI
import stores_ui
import stores
import networking
import common

@main
struct dandelionApp: App {
        
    
    
    @StateObject var storesViewModel = StoresViewModel(api: StoresApiInteractorFaker1())
    @StateObject var catalogueViewModel = CatalogueViewModel(api: StoresApiInteractorFaker1())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(storesViewModel)
                .environmentObject(catalogueViewModel)
                
        }
    }
}
