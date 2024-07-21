//
//  StoreRemoteRepositoryFaker.swift
//  stores
//
//  Created by Rommel Valdiviezo on 21/7/24.
//

import Foundation
import common

public class StoreRemoteRepositoryFaker: StoreRemoteRepository{
    
    public init(){
        
    }
    
    public func getStores(near location: Location) async -> UseCaseResponse<[Store]> {
        do{
            try await Task.sleep(nanoseconds: 2_000_000_000)
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
