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

@main
struct dandelionApp: App {
        
    @State var storesViewModel = StoresViewModel(repository: StoreRemoteRepositoryImpl())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(storesViewModel)
        }
    }
}
