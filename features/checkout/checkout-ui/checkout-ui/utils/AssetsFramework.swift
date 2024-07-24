//
//  AssetsFramework.swift
//  checkout-ui
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import Foundation
import SwiftUI
class HelperClass{
    
}

func loadImageFromAssets(name: String) -> UIImage {
        // Use FrameworkHelper class to get the correct bundle
        let bundle = Bundle(for: HelperClass.self)
        return UIImage(named: name, in: bundle, compatibleWith: nil)!
    }

