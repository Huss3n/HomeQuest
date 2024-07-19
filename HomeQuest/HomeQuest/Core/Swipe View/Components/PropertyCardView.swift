//
//  PropertyCardView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 19/07/2024.
//

import SwiftUI

struct PropertyCardView: View {
    var property = MockData.propertyInfo
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    headerCell
                        .frame(height: geo.size.height)
                        .scaledToFit()
                    
                    propertyDescription
                        .padding(.horizontal, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    facilities
                        .padding(.horizontal, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .scrollIndicators(.hidden)
            .background(
                LinearGradient(
                    colors: [
                        .blue.opacity(
                            0
                        ),
                        .red.opacity(
                            0.1
                        ),
                        .green.opacity(0.1)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(32)
        }
        
    }
}

#Preview {
    PropertyCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}

extension PropertyCardView {
    func formattedDouble(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
    
    
    private var headerCell: some View {
        ZStack(alignment: .bottomLeading) {
            Image(property.propertyImages.randomElement()!)
                .resizable()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(property.properyName), Khs \(formattedDouble(property.price))")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                HStack {
                    Image(systemName: "mappin")
                    Text(property.propertyAddress)
                }
                
                // MARK: Property info
                HStack {
                    Image("bed")
                    Text("\(property.bedrooms)")
                    
                    Image("bathroom")
                    Text("\(property.bathrooms)")
                    
                    Image("sizee")
                    Text("\(formattedDouble(property.squareFeet)) sqf")
                }
                .font(.callout)
                
                PropertyHeartView()
                    .onTapGesture {
                        
                    }
            }
            .foregroundStyle(.white)
            .padding(16)
            .font(.callout)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(
                    colors: [
                        .black.opacity(
                            0
                        ),
                        .black.opacity(
                            0.6
                        ),
                        .black.opacity(0.6)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
    
    private var propertyDescription: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Property Decription")
                .font(.headline)
                .padding(.top, 12)
            
            Text(property.propertyDescription)
                .font(.subheadline)
                .fontWeight(.light)
                .lineSpacing(12.0)
        }
    }
    
    private var facilities: some View {
        VStack(alignment: .leading) {
            Text("Property Facilities")
                .font(.headline)
                .padding(.top, 12)
            
            HStack {
                if let parking = property.facilities?.carParking {
                    if parking {
                        PropertyCapsule(imageName: "car", title: "Parking")
                    }
                }
                
                if let wifi = property.facilities?.wifi {
                    if wifi {
                        PropertyCapsule(imageName: "wifi", title: "Wi-Fi")
                    }
                }
                
                if let swimmingPool = property.facilities?.swimmingPool {
                    if swimmingPool {
                        PropertyCapsule(imageName: "swim", title: "Pool")
                    }
                }
            }
            .font(.callout)
            .foregroundStyle(.blue)
            
            HStack {
                if let gym = property.facilities?.gym {
                    if gym {
                        PropertyCapsule(imageName: "gym", title: "Gym")
                    }
                }
                
                if let pet = property.facilities?.petCenter {
                    if pet {
                        PropertyCapsule(imageName: "pet", title: "Pet")
                    }
                }
                
                if let laundry = property.facilities?.laundry {
                    if laundry {
                        PropertyCapsule(imageName: "wash", title: "Laundry")
                    }
                }
                
                if let sportsClub = property.facilities?.sportsClub {
                    if sportsClub {
                        PropertyCapsule(imageName: "run", title: "Sports")
                    }
                }
            }
        }
    }
}
