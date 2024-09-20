//
//  UserApiInteractorFaker.swift
//  test-resources
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation
import domain
import api

public class UserApiInteractorFaker: UserApiInteractor{
    public func getAuthenticatedUser() async -> User {
        return test_user
    }
    
    
    public init(){
        
    }
    
    public func getUserPreferedDeliveryLocation() async -> Place? {
        return Place(address: "Quito, Ecuador", latitude: "-0.17740", longitude: "-78.48096")
    }
    
    public func isAuthenticated() async -> Bool {
        return true
    }
    
    
}
