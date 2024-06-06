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

struct ContentView: View {
    var body: some View {
        StoresScreen()
    }
}

#Preview {
    @StateObject var storesViewModel = StoresViewModel(api: StoresApiInteractorFaker1())
    
    return ContentView()
        .environmentObject(storesViewModel)
}
