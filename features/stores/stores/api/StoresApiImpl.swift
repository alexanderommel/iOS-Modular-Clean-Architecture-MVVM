//
//  StoresApiImpl.swift
//  stores
//
//  Created by Rommel Valdiviezo on 21/7/24.
//

import Foundation
import common
import user

public class StoresApiImpl: StoresApiInteractor{
    
    let fetch_uc:FetchStoresUseCase
    let fetch_catalogue_uc: FetchCatalogueUseCase
    
    public init(store_remote_repo: StoreRemoteRepository, user_api_interactor: UserApiInteractor) {
        self.fetch_uc = FetchStoresUseCase(repository: store_remote_repo, userApi: user_api_interactor)
        self.fetch_catalogue_uc = FetchCatalogueUseCase(repository: store_remote_repo)
    }
    
    public func getStores() async -> UseCaseResponse<[Store]> {
        return await fetch_uc.invoke()
    }
    
    public func getCatalogue(from store: Store) async -> UseCaseResponse<Catalogue> {
        return await fetch_catalogue_uc.invoke(storeId: store.id)
    }
    
    
}
