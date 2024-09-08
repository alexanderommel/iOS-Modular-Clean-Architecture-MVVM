//
//  UserApiInteractor.swift
//  user
//
//  Created by Rommel Valdiviezo on 21/7/24.
//

import Foundation
import common


public protocol UserApiInteractor{
    
    
    func getUserPreferedDeliveryLocation() async -> Place?
    func isAuthenticated() async -> Bool
    func getAuthenticatedUser() async -> User
    
}
