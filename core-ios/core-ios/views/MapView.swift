//
//  MapView.swift
//  core-ios
//
//  Created by Rommel Valdiviezo on 27/7/24.
//

import SwiftUI
import MapKit

public struct MapView: View {
    
    var locationCoordinate: CLLocationCoordinate2D
    
    private var reg: MKCoordinateRegion {
            MKCoordinateRegion(
                center: locationCoordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        }
    
    
    public var body: some View {
        Map(position: .constant(.region(reg)))
    }
    
    public init(locationCoordinate: CLLocationCoordinate2D) {
        self.locationCoordinate = locationCoordinate
        print("MapView: Rendering map for latitude \(locationCoordinate.latitude) and longitude \(locationCoordinate.longitude)")
    }
    
}

#Preview {
    let longitude = -78.480943
    let latitude = -0.176567
    return MapView(locationCoordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
}
