//
//  MockData.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 18/07/2024.
//

import Foundation

struct PropertyMockDataModel: Identifiable {
    let id = UUID()
    let imageName: String
    let propertyName: String
    let propertyAmount: String
    let propertyLocation: String
}

struct MockData {
    static var propertyInfo: PropertyModel = PropertyModel(
        properyName: "Woodvale Grove",
        propertyAddress: "Rainy road, Kileleshwa",
        propertyDescription: "Discover your dream home in this beautifully designed 4-bedroom, 3-bathroom property located in a peaceful and highly sought-after neighborhood. This elegant home boasts an open-concept living space, featuring a modern kitchen with high-end stainless steel appliances, a spacious living room with a cozy fireplace, and large windows that flood the home with natural light.",
        propertyCoordinites: PropertyCoordinates(latitude:  -1.2825264158431462, longitude: 36.790346343476614),
        bedrooms: 4,
        bathrooms: 3,
        squareFeet: 1450,
        facilities: PropertyFacilites(
            carParking: true,
            swimmingPool: true,
            gym: true,
            wifi: true,
            petCenter: false,
            sportsClub: false,
            laundry: true
        ),
        price: 50000,
        propertyImages: [
            "pic1",
            "pic2",
            "pic3",
            "pic4",
            "pic5",
            "pic6",
            "pic7",
            "pic8",
            "pic9"
        ]
    )
    
    static var userData: UserModel = UserModel(
        fullName: "Hussein Aisak",
        email: "hussein@test.com",
        phoneNumber: "0729683600",
        profilePhoto: "pic1"
    )
    
    static var bookmarkedProperties: [PropertyMockDataModel] = [
        PropertyMockDataModel(imageName: "pic1", propertyName: "Woodvale Groove", propertyAmount: "50,000", propertyLocation: "Rainy road, Kileleshwa"),
        PropertyMockDataModel(imageName: "pic2", propertyName: "Greenwood Estate", propertyAmount: "70,000", propertyLocation: "Sea bird, Lavington"),
        PropertyMockDataModel(imageName: "pic3", propertyName: "Sunset Villa", propertyAmount: "80,000", propertyLocation: "707 Poplar St, Hurligham"),
    ]
    
}
