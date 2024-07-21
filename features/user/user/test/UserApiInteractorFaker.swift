//
//  UserApiInteractorFaker.swift
//  user
//
//  Created by Rommel Valdiviezo on 21/7/24.
//

import Foundation
import common

public class UserApiInteractorFaker: UserApiInteractor{
    
    public init(){
        
    }
    
    public func getUserPreferedDeliveryLocation() async -> Location? {
        return Location(address: "Quito, Ecuador", latitude: "111", longitude: "1111")
    }
    
    public func isAuthenticated() async -> Bool {
        return true
    }
    
    
}
