//
//  StoresApiInteractorFaker.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 5/6/24.
//

import Foundation
import common
import stores


public class StoresApiInteractorFaker1: StoresApiInteractor{
    
    public init(){
        
    }
    
    public func getCatalogue(from store: stores.Store) async  -> common.UseCaseResponse<stores.Catalogue> {
        
        do{
            try await Task.sleep(nanoseconds: 2_000_000_000)
        } catch {
            print("Error catch")
        }
        
        return UseCaseResponse.Success(data: catalog)
    }
    
    public func getStores() async -> UseCaseResponse<[stores.Store]> {
        
        do{
            try await Task.sleep(nanoseconds: 4_000_000_000)
        } catch {
            print("Error catch")
        }
        
        
        let stors: [Store] = [
            Store(id: 1, name: "Kfc 6 de Diciembre", deliveryTime: "30-40 min", deliveryFee: "2.50",
                  storeImage: "test_resource_kfc_store",rating: 4.5, distance: "1.2km",
                  location: Location(address: "6 de diciembre y veintimilla",latitude: "asd",longitude: "")),
            Store(id: 2, name: "Restaurante la casa morada", deliveryTime: "20-30 min", deliveryFee: "2.35",
                  storeImage: "test_resource_restaurant2",rating: 4.8, distance: "5 km",
                  location: Location(address: "Nayon calle transversal Quito y Atahualpa",latitude: "asd",longitude: "92"))
        ]
        
        return UseCaseResponse.Success(data: stors)
        
    }
    
}

public class StoresApiInteractorFaker2: StoresApiInteractor{
    
    public init(){
        
    }
    
    public func getCatalogue(from store: stores.Store) async -> common.UseCaseResponse<stores.Catalogue> {
        
        do{
            try await Task.sleep(nanoseconds: 2_000_000_000)
        } catch {
            print("Error catch")
        }
        
        return UseCaseResponse.Error(failure: BusinessRuleFailure.noInternetConnection)
        
    }
    
    public func getStores() async -> UseCaseResponse<[stores.Store]> {
        
        do{
            try await Task.sleep(nanoseconds: 2_000_000_000)
        } catch {
            print("Error catch")
        }
        
        return UseCaseResponse.Error(failure: BusinessRuleFailure.noInternetConnection)
        
    }
    
}
