//
//  PropertyCardView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 19/07/2024.
//

import SwiftUI

struct PropertyCardView: View {
    var property: PropertyModel = MockData.propertyInfo
    var user = MockData.userData
    
    var onCommentButtonPressed: (() -> Void)? = nil
    var onCallButtonPressed: (() -> Void)? = nil
    var onEmailButtonPressed: (() -> Void)? = nil
    var onXmarkButtonPressed: (() -> Void)? = nil
    var onCheckmarkButtonPressed: (() -> Void)? = nil
    var onHideAndReportButtonPressed: (() -> Void)? = nil
    var onSuperlikeButtonPressed: (() -> Void)? = nil
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    headerCell
                        .frame(height: geo.size.height)
                        .scaledToFit()
                    
                    propertyDescription
                        .padding(.top, 16)
                        .padding(.horizontal, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    facilities
                        .padding(.top, 16)
                        .padding(.horizontal, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    propertyPhotos
                        .padding(.top, 16)
                        .padding(.horizontal, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    RealtorView(user: user)
                        .padding(.top, 16)
                        .padding(.horizontal, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onTapGesture {
                            onCallButtonPressed?()
                            onEmailButtonPressed?()
                        }
                    
                    footer
                        .padding(.top, 60)
                        .padding(.bottom, 60)
                        .padding(.horizontal, 24)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            }
            .scrollIndicators(.hidden)
            .background(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure full coverage
            .overlay (
                superLike
                    .padding(14)
                , alignment: .bottomTrailing
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
    
    
    // MARK: Header
    private var headerCell: some View {
        ZStack(alignment: .bottomLeading) {
            Image(property.propertyImages[1])
                .resizable()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("\(property.properyName), Khs \(formattedDouble(property.price))")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                HStack {
                    Image(systemName: "mappin")
                    Text(property.propertyAddress)
                }
                HStack {
                    Image("bed")
                    Text("\(property.bedrooms)")
                    
                    Image("bathroom")
                    Text("\(property.bathrooms)")
                    
                    Image("sizee")
                    Text("\(formattedDouble(property.squareFeet)) sqf")
                }
                .font(.callout)
                
                PropertyCommentCapsule()
                    .onTapGesture {
                        onCommentButtonPressed?()
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
    
    // MARK: Property Description
    private var propertyDescription: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Decription")
                .font(.headline)
            
            Text(property.propertyDescription)
                .font(.subheadline)
                .fontWeight(.light)
                .lineSpacing(12.0)
        }
    }
    
    // MARK: Property Facilities
    private var facilities: some View {
        VStack(alignment: .leading) {
            Text("Facilities")
                .font(.headline)
            
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
    
    // MARK: Property Photos
    private var propertyPhotos: some View {
        VStack(alignment:.leading, spacing: 2) {
            Text("Photos")
                .font(.headline)
            
            ForEach(property.propertyImages, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFit()
            }
        }
    }
    
    // MARK: Superlike
    private var superLike: some View {
        Image(systemName: "hexagon.fill")
            .foregroundStyle(.yellow)
            .font(.system(size: 60))
            .overlay {
                Image(systemName: "star.fill")
                    .foregroundStyle(.blue)
                    .font(.system(size: 30))
            }
            .onTapGesture {
                onSuperlikeButtonPressed?()
            }
    }
    
    // MARK: Footer
    private var footer: some View {
        VStack {
            HStack {
                Circle()
                    .fill(.blue)
                    .overlay {
                        Image(systemName: "xmark")
                            .font(.title)
                    }
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onXmarkButtonPressed?()
                    }
                
                Spacer(minLength: 0)
                
                Circle()
                    .fill(.blue)
                    .overlay {
                        Image(systemName: "checkmark")
                            .font(.title)
                    }
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onCheckmarkButtonPressed?()
                    }
            }
            
            Text("Hide and Report")
                .font(.headline)
                .foregroundStyle(.primary.opacity(0.7))
                .padding(8)
                .background(.blue.opacity(0.001))
                .onTapGesture {
                    onHideAndReportButtonPressed?()
                }
            
        }
    }
    
}
