//
//  PropertyLocation.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 16/07/2024.
//

import SwiftUI
import MapKit
import CoreLocation

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}

struct PropertyLocation: View {
    @State var coordinateRegion: MKCoordinateRegion = {
        var newRegion = MKCoordinateRegion()
        newRegion.center.latitude = -1.2767338
        newRegion.center.longitude = 36.7879011
        newRegion.span.latitudeDelta = 0.125
        newRegion.span.longitudeDelta = 0.125
        return newRegion
    }()
    
    var annotationItems: [MyAnnotationItem] = [
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: -1.2767338, longitude: 36.7879011))
    ]
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $coordinateRegion,
                annotationItems: annotationItems) {item in
                MapPin(coordinate: item.coordinate)
            }
        }
        .frame(height: 250)
    }
}

#Preview {
    PropertyLocation()
}
