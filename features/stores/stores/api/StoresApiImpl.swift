//
//  StoresApiImpl.swift
//  stores
//
//  Created by Rommel Valdiviezo on 21/7/24.
//

import Foundation
import domain
import api

public class StoresApiImpl: StoresApiInteractor{
    
    
    let fetch_uc:FetchStoresUseCase
    let fetch_catalogue_uc: FetchCatalogueUseCase
    let fetch_store_uc:FetchStoreUseCase
    let fetch_product_uc: FetchProductUseCase
    
    public init(store_remote_repo: StoreRemoteRepository, user_api_interactor: UserApiInteractor) {
        self.fetch_uc = FetchStoresUseCase(repository: store_remote_repo, userApi: user_api_interactor)
        self.fetch_catalogue_uc = FetchCatalogueUseCase(repository: store_remote_repo)
        self.fetch_store_uc = FetchStoreUseCase(repository: store_remote_repo, userApi: user_api_interactor)
        self.fetch_product_uc = FetchProductUseCase(repository: store_remote_repo, userApi: user_api_interactor)
    }
    
    public func getStores() async -> UseCaseResponse<[Store]> {
        return await fetch_uc.invoke()
    }
    
    public func getCatalogue(from store: Store) async -> UseCaseResponse<Catalogue> {
        return await fetch_catalogue_uc.invoke(storeId: store.id)
    }
    
    public func getStoreById(id: Int) async -> UseCaseResponse<Store> {
        return await fetch_store_uc.invoke(id: id)
    }
    
    public func getProductById(id: Int) async -> UseCaseResponse<Product> {
        return await fetch_product_uc.invoke(id: id)
    }
    
}
