//
//  ToastStyle.swift
//  ui-dandelion
//
//  Created by Rommel Valdiviezo on 6/6/24.
//

import Foundation
import SwiftUI

public enum ToastStyle {
  case error
  case warning
  case success
  case info
    
}

public extension ToastStyle {
  var themeColor: Color {
    switch self {
    case .error: return Color.red
    case .warning: return Color.orange
    case .info: return Color.blue
    case .success: return Color.green
    }
  }
  
  var iconFileName: String {
    switch self {
    case .info: return "info.circle.fill"
    case .warning: return "exclamationmark.triangle.fill"
    case .success: return "checkmark.circle.fill"
    case .error: return "xmark.circle.fill"
    }
  }
}
