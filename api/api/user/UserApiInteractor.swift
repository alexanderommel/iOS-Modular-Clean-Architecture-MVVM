//
//  UserApiInteractor.swift
//  api
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation
import domain


public protocol UserApiInteractor{
    
    
    func getUserPreferedDeliveryLocation() async -> Place?
    func isAuthenticated() async -> Bool
    func getAuthenticatedUser() async -> User
    
}
