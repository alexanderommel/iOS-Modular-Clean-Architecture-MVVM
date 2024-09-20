//
//  NavigationExtension.swift
//  dandelion
//
//  Created by Rommel Valdiviezo on 1/9/24.
//

import Foundation
import SwiftUI
import CoreData
import Combine
import stores_ui
import checkout_ui
import api
import core_ios
import domain

public struct DestiNav: ViewModifier{
    public func body(content: Content) -> some View {
        content.navigationDestination(for: Destination.self){
            screen_name in
            
            
            switch screen_name{
            case .storesScreen(let user):
                StoresScreen(user: user)
            case .catalogueScreen(let store, let catalogue):
                CatalogueScreen(store: store, catalogue: catalogue)
            case .productScreen(let product, let store):
                ProductDetailScreen(product: product, store: store)
            case .shoppingCartsScreen(let carts):
                ShoppingCartsScreen(carts: carts)
            case .shoppingCartScreen(let checkout):
                ShoppingCartScreen(cart: checkout)
            case .checkoutScreen(let checkout):
                CheckoutScreen(c: checkout)
                
            @unknown default:
                Text("")
            }
        }
    }
}

public extension View{
    func setUpNav() -> some View{
        modifier(DestiNav())
    }
}
