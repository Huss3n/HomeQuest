//
//  PropertyDetail.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI
import MapKit

enum BookingOptions {
    case tour
    case realEstate
}

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
    @Environment(\.colorScheme) var colorScheme
    var active: [PropertyDetailStates] = [.description, .gallery, .review]
    
    @State private var bookingOption: BookingOptions = .tour
    
    @State private var selectedTab: PropertyDetailStates = .description
    
    @State private var selectedImage: String? = nil
    
    @State private var commentLikeCount: Int = 5
    @State private var commentDislikeCount: Int = 2
    
    @State private var bookingButtonPressed: Bool = false
    @State private var tourButtonPressed: Bool = false
    @State private var realEstateButtonPressed: Bool = false
    
    @State private var messageWasClicked: Bool = false
    @State private var phoneWasClicked: Bool = false
    
    let realtorPhoneNumber = "0729 683 600"
    
    var height = UIScreen.main.bounds.height
    
    let position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -1.2767338, longitude: 36.7879011),
            span: MKCoordinateSpan(latitudeDelta: 0.00125, longitudeDelta: 0.00125)
        )
    )
    
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil),
        GridItem(.flexible(), spacing: nil)
    ]
    
    var images = ["pic1", "pic2", "pic3", "pic4", "pic5", "pic6", "pic7", "pic8", "pic9"]
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                if height < height/2 {
                    Image(systemName: "xmark.circle")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                } else {
                    propertImages
                }
                
                
                ScrollView {
                    propertyRating
                    propertyName
                    activeTabSelection
                    
                    if selectedTab == .description {
                        propertyStats
                        RealtorView(user: MockData.userData, messageWasClicked: { messageWasClicked.toggle() }, phoneWasClicked: {
                            if let url = URL(string: "tel://\(realtorPhoneNumber)"), UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            }
                        })
                        .padding(.horizontal)
                        
                        facilities
                        propertyLocation
                        
                    } else if selectedTab == .gallery {
                        gallery
                    } else {
                        RealtorPreview()
                            .padding(.horizontal)
                    }
                    
                    
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 10)
                    
                }
                .scrollIndicators(.hidden)
                
                bookNowButton
            }
            .ignoresSafeArea()
            .toolbar(.hidden, for: .tabBar) // MARK: Book now Sheet
            .sheet(isPresented: $messageWasClicked, content: {
                ChatView()
            })
            .sheet(isPresented: $bookingButtonPressed, content: {
                BookNowPopUp(bookingOption: $bookingOption) {
                    if bookingOption == .tour {
                        bookingButtonPressed.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            tourButtonPressed.toggle()
                        }
                    } else if bookingOption == .realEstate {
                        bookingButtonPressed.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            realEstateButtonPressed.toggle()
                        }
                    }
                }
                    .presentationDetents([.fraction(0.15)])
            })
            .sheet(isPresented: $tourButtonPressed, content: { // MARK: Tour Sheet
                BookTour(tourButtonPressed: $tourButtonPressed)
            })
            .fullScreenCover(isPresented: $realEstateButtonPressed, content: {
                RealEstateView(realEstateButtonPressed: $realEstateButtonPressed)
            })
            
            if let selectedImage = selectedImage {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            self.selectedImage = nil
                        }
                    }
                
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .background(Color.black)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            self.selectedImage = nil
                        }
                    }
            }
        }
    }
}

#Preview {
    PropertyDetail()
}

extension PropertyDetail {
    private var gallery: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture {
                        withAnimation {
                            selectedImage = image
                        }
                    }
            }
        })
    }
    
    // MARK: Propert Images
    private var propertImages: some View {
        ZStack(alignment: .top) {
            Image("house")
                .resizable()
                .scaledToFit()
            
            HStack {
                Image(systemName: "arrow.left")
                    .padding(12)
                    .foregroundStyle(.black)
                    .background(.white)
                    .clipShape(Circle())
                    .onTapGesture {
                        dismiss()
                    }
                
                Spacer()
                
                Image(systemName: "heart")
                    .foregroundStyle(.black)
                    .padding(12)
                    .background(.white)
                    .clipShape(Circle())
                
                Image(systemName: "square.and.arrow.up")
                    .foregroundStyle(.black)
                    .padding(12)
                    .background(.white)
                    .clipShape(Circle())
            }
            .padding(.top, 32)
            .padding()
        }
    }
    
    // MARK: Property Rating
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
    
    // MARK: Property Name
    private var propertyName: some View {
        VStack(alignment: .leading) {
            Text("Woodland Apartment")
            Text("Ocean Avenue, Kileleshwa.")
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
    // MARK: ActiveTab Selection
    private var activeTabSelection: some View {
        HStack(spacing: 20) {
            ForEach(active, id: \.self) { activeTab in
                VStack(spacing: 6) {
                    Text(activeTab.displayName)
                        .foregroundStyle(activeTab == selectedTab ? .blue : .primary)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedTab = activeTab
                            }
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
    
    
    // MARK: Property Stats
    private var propertyStats: some View {
        HStack(spacing: 12) {
            PropertyCapsule(imageName: "sizee", count: 1225, title: "sqft")
            PropertyCapsule(imageName: "bed", count: 3, title: "Bedrooms")
            PropertyCapsule(imageName: "bathroom", count: 1, title: "Bathrom")
            PropertyCapsule(imageName: "security", count: 1225, title: "Safety Rank")
        }
        .padding(.top, 12)
    }
    
    // MARK: Facilities
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
    
    // MARK: Property Location
    private var propertyLocation: some View {
        VStack(alignment: .leading) {
            Text("Address")
                .font(.title3)
                .fontWeight(.semibold)
            HStack {
                Image(systemName: "mappin")
                Text("Ocean Avenue, Kileleshwa.")
            }
            .font(.subheadline)
            .foregroundStyle(.gray)
            
            PropertyLocation()
        }
        .padding(.horizontal)
        .padding(.top, 16)
    }
    
    
    // MARK: bookNowButton
    private var bookNowButton: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Total Price")
                    .font(.title3)
                    .fontWeight(.semibold)
                HStack(alignment: .center) {
                    Text("Ksh 50,000").foregroundStyle(.blue).font(.headline)
                    Text("/month")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("Book Now")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 120, height: 45)
                        .background(.blue)
                        .clipShape(Capsule())
                        .onTapGesture {
                            bookingButtonPressed.toggle()
                        }
                }
            }
        }
        .padding()
        .padding(.horizontal)
        .padding(.bottom, 20)
        .clipShape(.rect(topLeadingRadius: 20, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 20))
    }
}

