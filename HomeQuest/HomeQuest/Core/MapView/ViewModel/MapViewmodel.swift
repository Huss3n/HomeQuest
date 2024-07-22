//
//  MapViewmodel.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 18/07/2024.
//

import Foundation
import CoreLocation
import _MapKit_SwiftUI

final class MapViewmodel: ObservableObject {
    @Published var propertyLocations: [PropertyLocations] = []
    @Published var mapCameraPosition: MapCameraPosition = .automatic
    
    @Published var startPosition =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -1.2831838144889616, longitude: 36.79028931212648), span: MKCoordinateSpan(latitudeDelta: 0.00125, longitudeDelta: 0.00125))
    
    init() {
        addProperties()
    }
    
    func addProperties() {
         let baseLatitude = -1.2831838144889616
         let baseLongitude = 36.79028931212648
         
         let propertyNames = [
             "Sunset Villa",
             "Maple Cottage",
             "Greenwood Estate",
             "Bluebird Manor",
             "Lakeside Retreat",
             "Hillside Bungalow",
             "Palm Grove House",
             "Oakwood Residence",
             "Cedar Creek Home",
             "Willow Springs"
         ]
         
         for i in 0..<10 {
             let randomLatitude = baseLatitude + Double.random(in: -0.02...0.015)
             let randomLongitude = baseLongitude + Double.random(in: -0.02...0.015)
             let location = PropertyLocations(
                 name: propertyNames[i],
                 coordinates: CLLocationCoordinate2D(latitude: randomLatitude, longitude: randomLongitude)
             )
             propertyLocations.append(location)
         }
     }
    
    func changeCameraPosition(coordinates: CLLocationCoordinate2D, span: MKCoordinateSpan) {
        let mkPosition = MKCoordinateRegion(center: coordinates, span: span)
        self.mapCameraPosition = .region(mkPosition)
    }
    
}
