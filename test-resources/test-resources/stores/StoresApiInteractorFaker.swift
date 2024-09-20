//
//  StoresApiInteractorFaker.swift
//  test-resources
//
//  Created by Rommel Valdiviezo on 18/9/24.
//
import api
import domain

public class StoresApiInteractorFaker: StoresApiInteractor{
    public func getStores() async -> api.UseCaseResponse<[domain.Store]> {
        return UseCaseResponse.Success(data: stors)
    }
    
    public func getCatalogue(from store: domain.Store) async -> api.UseCaseResponse<domain.Catalogue> {
        return UseCaseResponse.Success(data: catalog)
    }
    
    public func getStoreById(id: Int) async -> api.UseCaseResponse<domain.Store> {
        return UseCaseResponse.Success(data: stors[0])
    }
    
    public func getProductById(id: Int) async -> api.UseCaseResponse<domain.Product> {
        return UseCaseResponse.Success(data: products1[0])
    }
    
    public init(){}
    
}
