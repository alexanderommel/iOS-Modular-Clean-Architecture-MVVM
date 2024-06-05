//
//  CommonFrameworkVariables.swift
//  common
//
//  Created by Rommel Valdiviezo on 5/6/24.
//

import Foundation

public class CommonFrameworkHelperClass{
    
}

public extension Bundle {
    static var fromCommonFramework: Bundle = {
        let bundleName = "common"

        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: CommonFrameworkHelperClass.self).resourceURL,
            Bundle.main.bundleURL
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }

        return Bundle(for: CommonFrameworkHelperClass.self)
    }()
}
