//
//  CatalogueViewModel.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 5/6/24.
//

import Foundation
import stores
import common
import Combine

public class CatalogueViewModel: ObservableObject{
    @Published var catalogue: Catalogue?
    @Published var errorLocalized: String?
    @Published var isLoading = true
    public var api: StoresApiInteractor
    
    public init(api: StoresApiInteractor) {
        
        self.api = api
        
    }
    
    public func fetchCatalogueData(from store: Store){
        
        self.isLoading = true
        self.errorLocalized = nil
        
        print("fetching data")
        
        Task{
            let response = await api.getCatalogue(from: store)
            switch response{
            case .Error(let failure):
                DispatchQueue.main.async {
                    self.errorLocalized = failure.handleBusinessRuleFailure()
                    self.isLoading = false
                }
            
            case .Success(let data):
                DispatchQueue.main.async {
                    print("catalogue load success")
                    print(data.categories.count)
                    self.catalogue = data
                    self.isLoading = false
                }
            
            @unknown default:
                _ = ""
            }
        }
        
    }
    
    
}

