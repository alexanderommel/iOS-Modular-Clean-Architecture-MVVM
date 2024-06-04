//
//  LocationView.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import SwiftUI
import ui_dandelion

struct LocationView: View {
    var body: some View {
        HStack{
            Group{
                Image(uiImage: loadImageFromAssets(name: "location_icon"))
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(8)
            }
            .background(Color.myPrimarySurfaceColor)
            .cornerRadius(10.0)
            .padding(.vertical,8)
            
            VStack(alignment: .leading){
                Text("Tu ubicación")
                    .foregroundStyle(Color.myText12Color)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                Text("Quito 6 de diciembre y avellana")
                    .foregroundStyle(Color(.black))
                    .fontWeight(.semibold)
                    .font(.subheadline)
            }
            .padding(.trailing, 12)
            .padding(.vertical,8)
            Spacer()
        }
        .background(.white)
        
    }
}

#Preview {
    LocationView()
}
