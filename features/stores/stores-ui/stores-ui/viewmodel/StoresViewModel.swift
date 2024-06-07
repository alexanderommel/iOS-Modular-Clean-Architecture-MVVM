//
//  StoresViewModel.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import Foundation
import common
import stores
import Combine


public class StoresViewModel: ObservableObject{
    @Published var stores: [Store] = []
    @Published var errorLocalized: String = ""
    @Published var isLoading = false
    public var api: StoresApiInteractor
    
    public init(api: StoresApiInteractor) {
        self.api = api
    }
    
    func upp(){
        self.isLoading = true
    }
    
    public func fetchStoresData(){
        
        self.isLoading = true
        self.errorLocalized = ""
        
        Task{
            print("Fetching stores...")
            
            let response = await api.getStores()
            print("Stores retrieved")
            switch response{
            case .Error(let failure):
                DispatchQueue.main.async {
                    print("Error failure...")
                    self.isLoading = false
                    self.errorLocalized = failure.handleBusinessRuleFailure()
                }
                
            case .Success(let data):
                DispatchQueue.main.async {
                    print(Thread.current.isMainThread)
                    print("Success")
                    self.isLoading = false
                    self.stores = data
                    print(self.stores.count.description)
                }
                
            @unknown default:
                self.stores = []
            }
        }
    }
    
    
}
