//
//  BusinessRuleFailure.swift
//  api
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation
import domain

public enum BusinessRuleFailure {
    case serviceUnavailable
    case notAuthorized
    case accountRestrictedPermissions
    case serverInMaintenance
    case noInternetConnection
    case locationNotFound
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
        case .locationNotFound:
            return "location.not_found"
        }
    }
    
}
