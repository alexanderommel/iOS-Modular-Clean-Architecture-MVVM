//
//  StoreRemoteRepositoryFaker.swift
//  test-resources
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation
import domain
import api

public class StoreRemoteRepositoryFaker: StoreRemoteRepository{
    public func getStore(id: Int, bearerToken: String) async -> UseCaseResponse<Store> {
        for storeval in stors{
            if storeval.id == id{
                return UseCaseResponse.Success(data: storeval)
            }
        }
        return UseCaseResponse.Error(failure: .noInternetConnection)
    }
    
    public func getProduct(id: Int, bearerToken: String) async -> UseCaseResponse<Product> {
        for cat in catalog.categories {
            for p in cat.products {
                if p.id == id {
                    return UseCaseResponse.Success(data: p)
                }
            }
        }
        return UseCaseResponse.Error(failure: .noInternetConnection)
    }
    
    
    public init(){
        
    }
    
    public func getStores(near location: Place) async -> UseCaseResponse<[Store]> {
        do{
            try await Task.sleep(nanoseconds: 1_000_000_000)
        } catch {
        }
        return UseCaseResponse.Success(data: stors)
    }
    
    public func getCatalogue(storeId: Int) async -> UseCaseResponse<Catalogue> {
        do{
            try await Task.sleep(nanoseconds: 1_000_000_000)
        } catch {
        }
        return UseCaseResponse.Success(data: catalog)
    }
    
}
