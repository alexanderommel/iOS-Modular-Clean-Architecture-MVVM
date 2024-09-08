//
//  UserApiInteractorFaker.swift
//  user
//
//  Created by Rommel Valdiviezo on 21/7/24.
//

import Foundation
import common

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


public let test_user = User(id: "1", accessToken: "9239sdj239fdsnkjn", firstname: "Rommel", email: "alexanderommelsw@gmail.com")
