//
//  ColorExtension.swift
//  ui-dandelion
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import Foundation
import SwiftUI

public extension Color {
    static var myPrimaryColor: Color {
        return Color("primaryc", bundle: .myFramework)
    }
    static var myPrimarySurfaceColor: Color {
        return Color("primary_surface", bundle: .myFramework)
    }
    static var myText12Color: Color {
        return Color("text12", bundle: .myFramework)
    }
    static var myText34Color: Color {
        return Color("text34", bundle: .myFramework)
    }
}
