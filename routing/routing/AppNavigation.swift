//
//  AppNavigation.swift
//  routing
//
//  Created by Rommel Valdiviezo on 15/8/24.
//

import Foundation

import user
import SwiftUI
import CoreData
import Combine
import stores
import checkout


public class NavigationRouter: ObservableObject {
    
    public init() {
    }
    
    
    @Published public var navPath = NavigationPath()
    
    public func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    public func navigateBack() {
        navPath.removeLast()
    }
    
    public func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    

}


public enum Destination: Hashable {
    
    
    case storesScreen(user: User)
    case catalogueScreen(store: Store, catalogue: Catalogue?)
    case productScreen(product: Product, store: Store)
    case shoppingCartsScreen(carts: [Checkout])
    case shoppingCartScreen(cart: Checkout)
    case checkoutScreen(checkout: Checkout)

    
    
    
    public static func == (lhs: Destination, rhs: Destination) -> Bool {
        if lhs.hashValue.description==rhs.hashValue.description{
            return true
        }else{
            return false
        }
    }
    
    
    
    public func hash(into hasher: inout Hasher) {
        
        switch self{
        case .storesScreen(user: _):
            hasher.combine(1)
        case .catalogueScreen(store: _, catalogue: _):
            hasher.combine(2)
        case .productScreen(product: _, store: _):
            hasher.combine(3)
        case .shoppingCartsScreen(carts: _):
            hasher.combine(4)
        case .shoppingCartScreen(cart: _):
            hasher.combine(5)
        case .checkoutScreen(checkout: _):
            hasher.combine(6)
        }
        
    }
    
}


