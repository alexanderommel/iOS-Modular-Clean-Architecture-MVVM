//
//  FetchStoresUseCase.swift
//  stores
//
//  Created by Rommel Valdiviezo on 5/6/24.
//

import Foundation
import common
import user

class FetchStoresUseCase{
    
    var repository: StoreRemoteRepository
    var userApi: UserApiInteractor
    
    init(repository: StoreRemoteRepository, userApi: UserApiInteractor) {
        self.repository = repository
        self.userApi = userApi
    }
    
    func invoke() async -> UseCaseResponse<[Store]>{
        
        let auth = await userApi.isAuthenticated()
        if !auth {
            return UseCaseResponse.Error(failure: .notAuthorized)
        }
        
        guard let deliveryloc = await userApi.getUserPreferedDeliveryLocation() else{
            return UseCaseResponse.Error(failure: .locationNotFound)
        }
        
        var stores: [Store]?=nil
        let res = await  repository.getStores(near: deliveryloc)
        
        if case .Error(let failure) = res {
            return UseCaseResponse.Error(failure: failure)
        }
        if case .Success(let data) = res {
            stores = data
        }
        
        
        return UseCaseResponse.Success(data: stores!)
        
    }
}
