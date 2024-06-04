//
//  StoresViewModel.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import Foundation
import common
import stores


public class StoresViewModel: Observable{
    @Published var stores: [Store] = []
    var repository: StoreRemoteRepository
    
    public init(repository: StoreRemoteRepository) {
        self.repository = repository
        
        Task{
            let loc = Location(address: "asd", latitude: "123", longitude: "gsd")
            let ans = await repository.getStores(near: loc)
            self.stores = ans
        }
        
    }
    
    
}
