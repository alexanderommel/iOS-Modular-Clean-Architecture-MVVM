//
//  ContentView.swift
//  dandelion
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import SwiftUI
import stores
import stores_ui
import networking
import common
import checkout

struct ContentView: View {
    var body: some View {
        StoresScreen()
    }
}

#Preview {
    @StateObject var storesViewModel = StoresViewModel(api: StoresApiInteractorFaker1())
    @StateObject var catalogueViewModel = CatalogueViewModel(api: StoresApiInteractorFaker1())
    @StateObject var productViewModel = ProductViewModel(api: CheckoutApiInteractorFaker1())
    
    return ContentView()
        .environmentObject(storesViewModel)
        .environmentObject(catalogueViewModel)
        .environmentObject(productViewModel)
}
