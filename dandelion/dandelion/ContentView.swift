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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Image(systemName: "star")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(StoresViewModel(repository: StoreRemoteRepositoryImpl()))
}
