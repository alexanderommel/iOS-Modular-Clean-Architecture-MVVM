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
    @Published var errorLocalized: String = ""
    var api: StoresApiInteractor
    
    public init(api: StoresApiInteractor) {
        self.api = api
        
        Task{
            let response = api.getStores()
            switch response{
            case .Error(let failure):
                self.errorLocalized = failure.handleBusinessRuleFailure()
            case .Success(let data):
                self.stores = data
            @unknown default:
                self.stores = []
            }
        }
        
    }
    
    
}
