//
//  SwipeViewmodel.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 20/07/2024.
//

import Foundation
import CoreLocation

final class SwipeViewmodel: ObservableObject {
    @Published var properties: [PropertyModel] = []
    
    init() {
        addProperties()
    }
    
    func addProperties() {
        let baseLatitude = -1.2831838144889616
        let baseLongitude = 36.79028931212648
        
        let propertyNames = [
            "Sunset Villa", "Maple Cottage", "Greenwood Estate", "Bluebird Manor",
            "Lakeside Retreat", "Hillside Bungalow", "Palm Grove House", "Oakwood Residence",
            "Cedar Creek Home", "Willow Springs"
        ]
        
        let propertyAddresses = [
            "123 Main St", "456 Maple Ave", "789 Oak St", "101 Pine Rd",
            "202 Cedar Ln", "303 Birch Blvd", "404 Elm St", "505 Ash St",
            "606 Cherry Ln", "707 Poplar St"
        ]
        
        let propertyDescriptions = [
            "A beautiful villa with stunning views. This property boasts a spacious living area, modern kitchen, and luxurious master suite. The outdoor area includes a large pool, perfect for entertaining guests. Located in a serene neighborhood, it offers both privacy and convenience.",
            "A cozy cottage surrounded by maple trees. This charming home features a warm and inviting interior, complete with a fireplace and hardwood floors. The kitchen is fully equipped with stainless steel appliances. Enjoy the peaceful surroundings from the comfort of your private deck.",
            "A large estate with plenty of green space. This property offers a grand entrance, multiple living areas, and a gourmet kitchen. The expansive grounds include beautiful gardens and a tennis court. Ideal for those who appreciate luxury and outdoor living.",
            "A charming manor with modern amenities. This home combines classic architecture with contemporary updates. It features a state-of-the-art kitchen, elegant dining room, and spacious bedrooms. The backyard is perfect for family gatherings, with a play area and BBQ pit.",
            "A lakeside retreat perfect for relaxation. This property offers stunning lake views from almost every room. It includes a private dock, a boat house, and a large deck. Inside, you'll find an open floor plan with plenty of natural light and a cozy fireplace.",
            "A bungalow situated on a hillside. This home features a unique layout with an open concept living area. The kitchen is designed for both style and function, with custom cabinetry and high-end appliances. The outdoor space includes a terraced garden and a fire pit.",
            "A house with a beautiful palm grove. This property offers a tropical paradise right in your backyard. It includes a large pool, outdoor kitchen, and plenty of space for lounging. Inside, the home is equally impressive with a modern design and high ceilings.",
            "A residence in a quiet oakwood neighborhood. This home is perfect for families, with spacious bedrooms and a large backyard. The kitchen is a chef's dream, with ample counter space and modern appliances. The living area is perfect for entertaining, with an open layout and plenty of light.",
            "A home by the scenic Cedar Creek. This property offers a tranquil setting with beautiful creek views. It features a wraparound porch, perfect for enjoying the outdoors. Inside, you'll find a comfortable living area, modern kitchen, and a luxurious master suite.",
            "A property with a picturesque willow spring. This home offers a unique blend of charm and modern convenience. It features a spacious living area, updated kitchen, and beautiful hardwood floors. The backyard includes a lovely garden and a gazebo, perfect for relaxing."
        ]

        let imageNames = ["pic1", "pic2", "pic3", "pic4", "pic5", "pic6"]

        properties = [] // Initialize or clear the properties array before adding new properties
        
        for i in 0..<10 {
            let randomLatitude = baseLatitude + Double.random(in: -0.01...0.01)
            let randomLongitude = baseLongitude + Double.random(in: -0.01...0.01)
            
            let propertyImages = imageNames.shuffled()
            
            let property = PropertyModel(
                properyName: propertyNames[i],
                propertyAddress: propertyAddresses[i],
                propertyDescription: propertyDescriptions[i],
                propertyCoordinites: PropertyCoordinates(
                    latitude: randomLatitude,
                    longitude: randomLongitude
                ),
                bedrooms: Int.random(in: 2...5),
                bathrooms: Int.random(in: 1...4),
                squareFeet: Double.random(in: 800...3_000),
                facilities: PropertyFacilites(
                    carParking: Bool.random(),
                    swimmingPool: Bool.random(),
                    gym: Bool.random(),
                    wifi: Bool.random(),
                    petCenter: Bool.random(),
                    sportsClub: Bool.random(),
                    laundry: Bool.random()
                ),
                price: Double.random(in: 50_000...150_000),
                propertyImages: Array(propertyImages.prefix(4))
            )
            
            properties.append(property)
        }
    }

}
