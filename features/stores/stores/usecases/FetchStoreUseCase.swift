//
//  FetchStoreUseCase.swift
//  stores
//
//  Created by Rommel Valdiviezo on 15/8/24.
//

import Foundation
import api
import domain


class FetchStoreUseCase{
    var repository: StoreRemoteRepository
    var userApi: UserApiInteractor
    
    init(repository: StoreRemoteRepository, userApi: UserApiInteractor) {
        self.repository = repository
        self.userApi = userApi
    }
    
    func invoke(id: Int) async -> UseCaseResponse<Store>{
        
        print("retrieving store with id \(id)")

        
        let auth = await userApi.isAuthenticated()
        if !auth {
            return UseCaseResponse.Error(failure: .notAuthorized)
        }
        
        let token = await userApi.getAuthenticatedUser().getBearerToken()
        
        let res = await repository.getStore(id: id, bearerToken: token)
        
        var store: Store?=nil
        if case .Error(let failure) = res {
            return UseCaseResponse.Error(failure: failure)
        }
        if case .Success(let data) = res {
            store = data
        }
        
        return UseCaseResponse.Success(data: store!)
        
        
    }
    
}
