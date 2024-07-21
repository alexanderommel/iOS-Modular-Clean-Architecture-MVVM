//
//  StoreRemoteRepository.swift
//  stores
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import Foundation
import common

public protocol StoreRemoteRepository{
    func getStores(near location: Location) async -> UseCaseResponse<[Store]>
    func getCatalogue(storeId: Int) async -> UseCaseResponse<Catalogue>
}



