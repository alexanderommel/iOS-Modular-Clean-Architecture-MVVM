//
//  UseCaseResponse.swift
//  common
//
//  Created by Rommel Valdiviezo on 4/6/24.
//

import Foundation


public enum UseCaseResponse<T: Any>{
    case Error(failure: BusinessRuleFailure)
    case Success(data: T)
}
