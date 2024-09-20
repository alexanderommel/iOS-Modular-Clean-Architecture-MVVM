//
//  OrderState.swift
//  domain
//
//  Created by Rommel Valdiviezo on 19/9/24.
//

//
//  OrderState.swift
//  orders
//
//  Created by Rommel Valdiviezo on 12/9/24.
//

import Foundation

public enum OrderState{
    case CREATED
    case PAYMENT_ACCEPTED
    case IN_PROGRESS
    case PREPARING
    case DELIVERING
    case CANCELED
    case COMPLETED
}
