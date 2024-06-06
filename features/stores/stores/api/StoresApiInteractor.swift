//
//  StoresApiInteractor.swift
//  stores
//
//  Created by Rommel Valdiviezo on 5/6/24.
//

import Foundation
import common

public protocol StoresApiInteractor{
    // The location is retrieved from the user stored data
    func getStores() async -> UseCaseResponse<[Store]>
    func getCatalogue(from store: Store) async -> UseCaseResponse<Catalogue>
}
