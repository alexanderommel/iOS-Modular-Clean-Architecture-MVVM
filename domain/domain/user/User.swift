//
//  User.swift
//  domain
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation

public class User: Identifiable, Codable, Hashable{
    
    public var id: String
    public var accessToken: String
    public var firstname: String
    public var email: String
    
    public init(id: String, accessToken: String, firstname: String, email: String) {
        self.id = id
        self.accessToken = accessToken
        self.firstname = firstname
        self.email = email
    }
    
    public func getBearerToken() -> String{
        return "Bearer \(accessToken)"
    }
    
    public static func == (lhs: User, rhs: User) -> Bool {
        if lhs.id==rhs.id{
            return true
        }else{
            return false
        }
    }
    
    
    
    public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    
}
