//
//  StoreRemoteRepository.swift
//  api
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation
import domain

public protocol StoreRemoteRepository{
    func getStores(near location: Place) async -> UseCaseResponse<[Store]>
    func getCatalogue(storeId: Int) async -> UseCaseResponse<Catalogue>
    func getStore(id: Int, bearerToken: String) async -> UseCaseResponse<Store>
    func getProduct(id: Int, bearerToken: String) async -> UseCaseResponse<Product>
}
