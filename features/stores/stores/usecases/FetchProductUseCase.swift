//
//  FetchProductUseCase.swift
//  stores
//
//  Created by Rommel Valdiviezo on 19/8/24.
//

import Foundation
import api
import domain


class FetchProductUseCase{
    
    var repository: StoreRemoteRepository
    var userApi: UserApiInteractor
    
    init(repository: StoreRemoteRepository, userApi: UserApiInteractor) {
        self.repository = repository
        self.userApi = userApi
    }
    
    func invoke(id: Int) async -> UseCaseResponse<Product>{
        
        print("retrieving product with id \(id)")
        
        let auth = await userApi.isAuthenticated()
        if !auth {
            return UseCaseResponse.Error(failure: .notAuthorized)
        }
        
        let token = await userApi.getAuthenticatedUser().getBearerToken()
        
        let res = await repository.getProduct(id: id, bearerToken: token)
        
        var product: Product?=nil
        if case .Error(let failure) = res {
            return UseCaseResponse.Error(failure: failure)
        }
        if case .Success(let data) = res {
            product = data
        }
        
        return UseCaseResponse.Success(data: product!)
        
        
    }
}
