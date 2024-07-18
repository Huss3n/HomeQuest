//
//  PropertyLocations.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 18/07/2024.
//

import Foundation
import CoreLocation

struct PropertyLocations: Identifiable {
    var id = UUID().uuidString
    var name: String
    var coordinates: CLLocationCoordinate2D
}



