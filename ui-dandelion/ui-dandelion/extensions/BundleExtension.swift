//
//  BundleExtension.swift
//  ui-dandelion
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import Foundation

class HelperClass{
    
}


extension Bundle {
    static var myFramework: Bundle = {
        let bundleName = "ui-dandelion"

        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: HelperClass.self).resourceURL,
            Bundle.main.bundleURL
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }

        return Bundle(for: HelperClass.self)
    }()
}
