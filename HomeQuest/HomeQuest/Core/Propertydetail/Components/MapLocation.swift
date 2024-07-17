//
//  MapLocation.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 16/07/2024.
//

import Foundation
import CoreLocation

struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
