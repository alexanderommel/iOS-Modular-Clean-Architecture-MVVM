//
//  Toast.swift
//  ui-dandelion
//
//  Created by Rommel Valdiviezo on 6/6/24.
//

import Foundation

public struct Toast: Equatable {
  var style: ToastStyle
  var message: String
  var duration: Double = 3
  var width: Double = .infinity
    
    public init(style: ToastStyle, message: String, duration: Double, width: Double) {
        self.style = style
        self.message = message
        self.duration = duration
        self.width = width
    }
}
