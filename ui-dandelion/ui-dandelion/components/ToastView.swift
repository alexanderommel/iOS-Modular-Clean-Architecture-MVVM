//
//  ToastView.swift
//  ui-dandelion
//
//  Created by Rommel Valdiviezo on 6/6/24.
//

import SwiftUI

public struct ToastView: View {
  
    var style: ToastStyle
    var message: String
    var width = CGFloat.infinity
    var onCancelTapped: (() -> Void)
    
    public init(style: ToastStyle, message: String, width: CGFloat = CGFloat.infinity, onCancelTapped: @escaping () -> Void) {
        self.style = style
        self.message = message
        self.width = width
        self.onCancelTapped = onCancelTapped
    }
  
  public var body: some View {
    HStack(alignment: .center, spacing: 12) {
      Image(systemName: style.iconFileName)
        .foregroundColor(style.themeColor)
      Text(message)
        .font(Font.caption)
        .fontWeight(.semibold)
        .foregroundColor(Color.white)
      
      Spacer(minLength: 10)
      
      Button {
        onCancelTapped()
      } label: {
        Image(systemName: "xmark")
          .foregroundColor(style.themeColor)
      }
    }
    .padding()
    .frame(minWidth: 0, maxWidth: width)
    .background(Color.black)
    .cornerRadius(8)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .opacity(0.5)
    )
    .padding(.horizontal, 16)
  }
}

public extension View {

  func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
  }
}


