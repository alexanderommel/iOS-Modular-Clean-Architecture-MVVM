//
//  UseCaseResponse.swift
//  api
//
//  Created by Rommel Valdiviezo on 18/9/24.
//


import Foundation


public enum UseCaseResponse<T: Any>{
    case Error(failure: BusinessRuleFailure)
    case Success(data: T)
}
