//
//  BundleExtension.swift
//  persistence
//
//  Created by Rommel Valdiviezo on 20/8/24.
//

import Foundation


class HelperClass{}


extension Bundle {
    static var myFramework: Bundle = {
        let bundleName = "persistence"

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
