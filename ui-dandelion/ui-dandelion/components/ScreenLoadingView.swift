//
//  ScreenLoadingView.swift
//  ui-dandelion
//
//  Created by Rommel Valdiviezo on 6/6/24.
//

import SwiftUI

public struct IndeterminateScreenLoadingView: View {
    @State var progress: Double = 0
    let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    @State private var text: String = "Loading"
    private var values: [String] = ["Loading", ".", "..","..."]


    private func updateLoadingPoints() {
        if progress<=0.5{
            self.text = values[1]
            return
        }
        if progress<=0.8{
            self.text = values[2]
            return
        }
        if progress<=1{
            self.text = values[3]
        }
        
    }
        
    public var body: some View {
            VStack {
                Spacer()
                ZStack {
                    CircularProgressView(progress: progress)
                    Text("\(progress * 100, specifier: "%.0f")")
                        .font(.largeTitle)
                        .bold()
                        .hidden()
                    
                }.frame(width: 200, height: 200)
                Spacer()
                VStack {
                    Text("Loading")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(text)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.myPrimaryColor)
                        .id(text)
                        .transition(.opacity.animation(.linear))
                }
            }
            .onReceive(timer) { _ in
                if progress >= 1.0 {
                    self.progress=0
                }else{
                    self.progress+=0.1
                    updateLoadingPoints()
                }
            }
        }
        
        func resetProgress() {
            progress = 0
        }
    public init(){
        
    }
}

#Preview {
    IndeterminateScreenLoadingView()
}
