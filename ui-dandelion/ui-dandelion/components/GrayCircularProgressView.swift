//
//  GrayCircularProgressView.swift
//  ui-dandelion
//
//  Created by Rommel Valdiviezo on 12/9/24.
//

import SwiftUI

public struct GrayCircularProgressView: View {
    
    let progress: Double
    
    public init(progress: Double) {
        self.progress = progress
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(
                    .gray.opacity(0.2),
                    lineWidth: 4
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    .gray.opacity(0.6),
                    style: StrokeStyle(
                        lineWidth: 4,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)

        }
    }
}

#Preview {
    return GrayCircularProgressView(progress: 0)
}
