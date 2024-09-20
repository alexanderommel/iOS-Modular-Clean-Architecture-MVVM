//
//  FrameworkExtension.swift
//  test-resources
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation

public class TestingFrameworkHelperClass{
    
}

public extension Bundle {
    static var fromTestingFramework: Bundle = {
        let bundleName = "test-resources"

        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: TestingFrameworkHelperClass.self).resourceURL,
            Bundle.main.bundleURL
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }

        return Bundle(for: TestingFrameworkHelperClass.self)
    }()
}
