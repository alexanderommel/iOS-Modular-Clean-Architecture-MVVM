//
//  AssetsFramework.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 3/6/24.
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
