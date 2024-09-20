//
//  StoresApiInteractor.swift
//  api
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import domain

public protocol StoresApiInteractor{
    // The location is retrieved from the user stored data
    func getStores() async -> UseCaseResponse<[Store]>
    func getCatalogue(from store: Store) async -> UseCaseResponse<Catalogue>
    func getStoreById(id: Int) async -> UseCaseResponse<Store>
    func getProductById(id: Int) async -> UseCaseResponse<Product>
}
