//
//  StoresScreen.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import SwiftUI
import stores

public struct StoresScreen: View {
    
    @Environment(StoresViewModel.self) var vm
    
    
    public var body: some View {
        List{
            ForEach(vm.stores){ store in
                Text(store.id.description)
            }
        }
    }
}

#Preview {
    StoresScreen()
        .environment(StoresViewModel(repository: StoreRemoteRepositoryMock()))
}
