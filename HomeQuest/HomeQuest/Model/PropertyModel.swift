//
//  PropertyModel.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 18/07/2024.
//

import Foundation
import CoreLocation

struct PropertyModel {
    var properyName: String
    var propertyAddress: String
    var propertyDescription: String
    var propertyCoordinites: PropertyCoordinates
    var bedrooms: Int
    var bathrooms: Int
    var squareFeet: Double
    var facilities: PropertyFacilites?
    var price: Double
    var propertyImages: [String]
    
}


struct PropertyCoordinates {
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
}


struct PropertyFacilites {
    var carParking: Bool?
    var swimmingPool: Bool?
    var gym: Bool?
    var wifi: Bool?
    var petCenter: Bool?
    var sportsClub: Bool?
    var laundry: Bool?
}

