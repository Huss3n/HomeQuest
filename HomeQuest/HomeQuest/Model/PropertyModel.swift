//
//  PropertyModel.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 18/07/2024.
//

import Foundation
import CoreLocation

struct PropertyModel: Identifiable, Hashable {
    var id = UUID().hashValue
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
    
    // Implement Hashable protocol
       func hash(into hasher: inout Hasher) {
           hasher.combine(id)
       }
    
    static func == (lhs: PropertyModel, rhs: PropertyModel) -> Bool {
        return lhs.id == rhs.id
    }
    
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

