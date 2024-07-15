//
//  PropertyDetail.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

enum PropertyDetailStates {
    case description
    case gallery
    case review
    
    var displayName: String {
        switch self {
        case .description:
            return "Description"
        case .gallery:
            return "Gallery"
        case .review:
            return "Review"
        }
    }
}

struct PropertyDetail: View {
    @Environment(\.dismiss) var dismiss
    var active: [PropertyDetailStates] = [.description, .gallery, .review]
    @State private var selectedTab: PropertyDetailStates = .gallery
    
    @State private var selectedImage: Bool = false
    
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil),
        GridItem(.flexible(), spacing: nil)
    ]
    
    var images = ["pic1", "pic2", "pic3", "pic4", "pic5", "pic6", "pic7", "pic8", "pic9"]
    
    var body: some View {
        VStack(spacing: 20) {
            propertImages
            
            ScrollView {
                propertyRating
                propertyName
                activeTabSelection
                
                if selectedTab == .description {
                    description
                } else if selectedTab == .gallery {
                    LazyVGrid(columns: columns, content: {
                        ForEach(images, id: \.self) { image in
                            
                            ZStack {
                                Image(image)
                                    .resizable()
                                    .scaledToFit()
                                    .blur(radius: selectedImage ? 4 : 0)
                                
                                if selectedImage {
                                    Image(image)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                         
                        }
                    })
                    
                }
                
                
                Divider()
                bookNowButton
                
                Rectangle()
                    .fill(.clear)
                    .frame(height: 30)
                
            }
            
        }
        .ignoresSafeArea()
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    PropertyDetail()
}



extension PropertyDetail {
    
    private var description: some View {
        Group {
            propertyStats
            listingAgent
            facilities
            propertyLocation
        }
    }
    
    // MARK: propertImages
    private var propertImages: some View {
        ZStack(alignment: .top) {
            Image("house")
                .resizable()
                .scaledToFit()
            
            HStack {
                Image(systemName: "arrow.left")
                    .padding(12)
                    .background(.white)
                    .clipShape(Circle())
                    .onTapGesture {
                        dismiss()
                    }
                
                Spacer()
                
                Image(systemName: "heart")
                    .padding(12)
                    .background(.white)
                    .clipShape(Circle())
                
                Image(systemName: "square.and.arrow.up")
                    .padding(12)
                    .background(.white)
                    .clipShape(Circle())
            }
            .padding(.top, 32)
            .padding()
        }
    }
    
    // MARK: propertyRating
    private var propertyRating: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
            Text("4.9 (6.8k review)")
            
            Spacer()
            
            Text("Apartment")
                .foregroundStyle(.blue)
                .padding(10)
                .background(.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
        }
        .foregroundStyle(.gray)
        .padding(.horizontal)
    }
    
        // MARK: propertyName
    private var propertyName: some View {
        // MARK: Propert name
        VStack(alignment: .leading) {
            Text("Woodland Apartment")
            Text("1012 Ocean Avenue, New York, USA")
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
    // MARK: activeTabSelection
    private var activeTabSelection: some View {
        HStack(spacing: 20) {
            ForEach(active, id: \.self) { activeTab in
                VStack(spacing: 6) {
                    Text(activeTab.displayName)
                        .foregroundStyle(activeTab == selectedTab ? .blue : .primary)
                        .onTapGesture {
                            selectedTab = activeTab
                        }
                    
                    Rectangle()
                        .fill(activeTab == selectedTab ? .blue : .clear)
                        .frame(height: 2)
                }
                
            }
        }
        .font(.headline)
        .padding(.top)
    }
    
    private var propertyStats: some View {
        HStack(spacing: 12) {
            PropertyCapsule(imageName: "sizee", count: 1225, title: "sqft")
            PropertyCapsule(imageName: "bed", count: 3, title: "Bedrooms")
            PropertyCapsule(imageName: "bathroom", count: 1, title: "Bathrom")
            PropertyCapsule(imageName: "security", count: 1225, title: "Safety Rank")
        }
        .padding(.top, 12)
    }
    
    
    private var listingAgent: some View {
        VStack(alignment: .leading) {
            Text("Listing Agent")
                .font(.title3)
                .fontWeight(.semibold)
            
            HStack(spacing: 12) {
                Circle()
                    .fill(.gray.opacity(0.3))
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading) {
                    Text("Hussein Aiak")
                        .fontWeight(.semibold)
                    Text("Patner")
                }
                
                Spacer()
                
                HStack(spacing: 30) {
                    Image("email")
                    Image("phone")
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 14)
    }
    
    
    private var facilities: some View {
        VStack(alignment: .leading) {
            Text("Facilities")
                .font(.title3)
                .fontWeight(.semibold)
            
            HStack(spacing: 12) {
                PropertyCapsule(imageName: "car", title: "Car Parking")
                PropertyCapsule(imageName: "swim", title: "Swimming")
                PropertyCapsule(imageName: "gym", title: "Gym")
                PropertyCapsule(imageName: "hotel", title: "Restaraunt")
            }
            
            HStack(spacing: 14) {
                PropertyCapsule(imageName: "wifi", title: "Wifi")
                PropertyCapsule(imageName: "pet", title: "Pet Center")
                PropertyCapsule(imageName: "run", title: "Sports")
                PropertyCapsule(imageName: "wash", title: "Laundry")
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
    
    
    private var propertyLocation: some View {
        VStack(alignment: .leading) {
            Text("Address")
                .font(.title3)
                .fontWeight(.semibold)
            HStack {
                Image(systemName: "mappin")
                Text("1012 Ocean Avenue, New York, USA")
            }
            .font(.subheadline)
            .foregroundStyle(.gray)
            
            // add a map showing location
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray.opacity(0.2))
                .frame(maxWidth: .infinity)
                .frame(height: 250)
        }
        .padding(.horizontal)
        .padding(.top, 16)
    }
    
    private var bookNowButton: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Total Price")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                HStack(alignment: .center) {
                    Text("$350").foregroundStyle(.blue).font(.headline)
                    Text("/ month")
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Text("Book Now")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .padding(.horizontal, 32)
                        .background(.blue)
                        .clipShape(Capsule())
                }
                
            }
        }
        .padding(.horizontal)
        .padding(.top, 16)
    }
}