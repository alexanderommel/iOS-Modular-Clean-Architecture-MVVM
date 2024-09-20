//
//  FetchCatalogueUseCase.swift
//  stores
//
//  Created by Rommel Valdiviezo on 21/7/24.
//

import Foundation
import api
import domain


class FetchCatalogueUseCase{
    var repository: StoreRemoteRepository
    
    init(repository: StoreRemoteRepository) {
        self.repository = repository
    }
    
    func invoke(storeId: Int) async -> UseCaseResponse<Catalogue>{
        
        let res = await repository.getCatalogue(storeId: storeId)
        
        var catalogue: Catalogue?=nil
        
        if case .Error(let failure) = res {
            return UseCaseResponse.Error(failure: failure)
        }
        if case .Success(let data) = res {
            catalogue = data
        }
        
        return UseCaseResponse.Success(data: catalogue!)
        
    }
    
}
