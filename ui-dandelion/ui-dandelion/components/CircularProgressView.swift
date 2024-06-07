//
//  CircularProgressView.swift
//  ui-dandelion
//
//  Created by Rommel Valdiviezo on 6/6/24.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.myPrimaryColor.opacity(0.5),
                    lineWidth: 15
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.myPrimaryColor,
                    style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)

        }
    }
}

#Preview {
    CircularProgressView(progress: 0.5)
}
