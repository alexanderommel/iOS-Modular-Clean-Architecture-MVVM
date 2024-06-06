//
//  BusinessRuleFailure.swift
//  common
//
//  Created by Rommel Valdiviezo on 4/6/24.
//

import Foundation

public enum BusinessRuleFailure {
    case serviceUnavailable
    case notAuthorized
    case accountRestrictedPermissions
    case serverInMaintenance
    case noInternetConnection
    case inputMissing(missingField: String)
    case remoteDataChanged
    
    // Returns the localizable key
    public func handleBusinessRuleFailure() -> String {
        switch self {
        case .serviceUnavailable:
            return "http.service_unavailable"
        case .notAuthorized:
            return "http.not_authorized"
        case .accountRestrictedPermissions:
            return "http.restricted"
        case .serverInMaintenance:
            return "http.server_down"
        case .noInternetConnection:
            return "network.no_internet"
        case .inputMissing(let missingField):
            return "missing.\(missingField)"
        case .remoteDataChanged:
            return "network.data_changed"
        }
    }
    
}
