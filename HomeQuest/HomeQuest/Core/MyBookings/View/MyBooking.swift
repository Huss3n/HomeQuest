//
//  MyBooking.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 23/07/2024.
//

import SwiftUI

enum BookingStatus: String, Filterable {
    case upcoming
    case complete
    case cancelled

    var displayName: String {
        switch self {
        case .upcoming:
            return "Upcoming"
        case .complete:
            return "Complete"
        case .cancelled:
            return "Cancelled"
        }
    }
}

struct MyBooking: View {
    @State private var cancelButtonPressed: Bool = false
    @State private var rescheduleButtonPressed: Bool = false
    @State private var rateExpirienceButtonPressed: Bool = false
    @State private var rebookButtonPressed: Bool = false
    @State private var bookingStatus: BookingStatus = .upcoming
    @Namespace private var namespace
    
    @State private var booktour: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 4) {
                HeaderFilter(selectedFilter: $bookingStatus)
                
                ScrollView {
                    if bookingStatus == .upcoming {
                        upcoming
                    } else if bookingStatus == .complete {
                        complete
                    } else {
                        cancel
                    }
                }
            }
            .navigationTitle("My Bookings")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $cancelButtonPressed, content: {
                CancelBooking()
            })
            .sheet(isPresented: $rescheduleButtonPressed, content: {
                BookTour(tourButtonPressed: $booktour)
            })
            .sheet(isPresented: $rateExpirienceButtonPressed, content: {
                Text("Rate your expirience")
            })
            .sheet(isPresented: $rebookButtonPressed, content: {
                BookTour(tourButtonPressed: $booktour)
            })
        }
    }
}

#Preview {
    MyBooking()
}


extension MyBooking {
    // completed
    private var upcoming: some View {
        Group {
            bookingComponent(
                propertyName: "Woodvale Apartments",
                propertyLocation: "Rainy Road, Kileleshwa",
                propertyImage: "pic3",
                bedroomCount: "4",
                bathroomCount: "3",
                propertyType: "Apartment",
                propertyRating: "4.0",
                size: "1200sqft",
                price: "Ksh 50,000",
                cancelButtonPressed: { cancelButtonPressed.toggle() },
                rescheduleButtonPressed: { rescheduleButtonPressed.toggle() }
            )
            
            bookingComponent(
                propertyName: "Peaceful Heightss",
                propertyLocation: "Sea lane, Lavington",
                propertyImage: "pic2",
                bedroomCount: "5",
                bathroomCount: "3",
                propertyType: "Villa",
                propertyRating: "4.6",
                size: "1500sqft",
                price: "Ksh 80,000",
                cancelButtonPressed: { cancelButtonPressed.toggle() },
                rescheduleButtonPressed: { rescheduleButtonPressed.toggle() }
            )
            
            bookingComponent(
                propertyName: "The Palms",
                propertyLocation: "Leads road, South B",
                propertyImage: "pic5",
                bedroomCount: "3",
                bathroomCount: "2",
                propertyType: "Apartment",
                propertyRating: "4.5",
                size: "120 sq. m",
                price: "Ksh 60,000",
                cancelButtonPressed: { cancelButtonPressed.toggle() },
                rescheduleButtonPressed: { rescheduleButtonPressed.toggle() }
            )
            
            bookingComponent(
                propertyName: "Riverside Retreat",
                propertyLocation: "Riverside, Westlands",
                propertyImage: "pic1",
                bedroomCount: "3",
                bathroomCount: "2",
                propertyType: "Villa",
                propertyRating: "4.2",
                size: "180 sq. m",
                price: "Ksh 85,0000",
                cancelButtonPressed: { cancelButtonPressed.toggle() },
                rescheduleButtonPressed: { rescheduleButtonPressed.toggle() }
            )
        }
    }
    
    private var complete: some View {
        Group {
            bookingComponent(
                propertyName: "Hilltop Haven",
                propertyLocation: "Hurlingham, Nairobi",
                propertyImage: "pic6",
                bedroomCount: "4",
                bathroomCount: "3",
                propertyType: "House",
                propertyRating: "4.8",
                size: "250 sq. m",
                price: "Ksh 60,0000",
                status: .complete,
                rateExpirienceButtonPressed: { rateExpirienceButtonPressed.toggle() }
            )
            
            bookingComponent(
                propertyName: "Ocean Breeze",
                propertyLocation: "Sea Bird, South C",
                propertyImage: "pic8",
                bedroomCount: "2",
                bathroomCount: "2",
                propertyType: "Beachfront Apartment",
                propertyRating: "4.3",
                size: "800 sq. m",
                price: "Ksh 120,000",
                status: .complete,
                rateExpirienceButtonPressed: { rateExpirienceButtonPressed.toggle() }
            )
        }
    }
    
    private var cancel: some View {
        Group {
            bookingComponent(
                propertyName: "Karen Villa",
                propertyLocation: "Karen, Nairobi",
                propertyImage: "pic5",
                bedroomCount: "5",
                bathroomCount: "4",
                propertyType: "Detached House",
                propertyRating: "4.9",
                size: "350 sq. m",
                price: "Ksh 90,000",
                status: .cancelled,
                rebookButtonPressed: { rebookButtonPressed.toggle() }
            )
            
            bookingComponent(
                propertyName: "The Loft",
                propertyLocation: "Lavington, Nairobi",
                propertyImage: "pic3",
                bedroomCount: "1",
                bathroomCount: "1",
                propertyType: "Studio Apartment",
                propertyRating: "4.7",
                size: "50 sq. m",
                price: "Ksh 22,000",
                status: .cancelled,
                rebookButtonPressed: { rebookButtonPressed.toggle() }
            )
        }
    }
}

extension MyBooking {
    private func bookingComponent(
        propertyName: String,
        propertyLocation: String,
        propertyImage: String,
        bedroomCount: String,
        bathroomCount: String,
        propertyType: String,
        propertyRating: String,
        size: String,
        price: String,
        cancelButtonPressed: (() -> ())? = nil,
        rescheduleButtonPressed: (() -> ())? = nil,
        status: BookingStatus? = nil,
        rateExpirienceButtonPressed: (() -> ())? = nil,
        rebookButtonPressed: (() -> ())? = nil
    ) -> some View {
        VStack {
            HStack(spacing: 10) {
                Image(propertyImage)
                    .resizable()
                    .frame(width: 89, height: 89)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(propertyRating)

                        Text(propertyType)
                            .foregroundStyle(.blue)
                            .padding(2)
                            .padding(.horizontal, 4)
                            .background(.blue.opacity(0.1))
                            .clipShape(Capsule())
                            .padding(.leading, 20)
                    }
                    .font(.subheadline)
                    
                    Text(propertyName)
                        .font(.headline)
                    
                    HStack {
                        Image(systemName: "mappin")
                        Text(propertyLocation)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    
                    HStack {
                        Image("bed")
                        Text(bedroomCount)
                        
                        Image("bathroom")
                        Text(bathroomCount)
                        
                        Image("sizee")
                        Text(size)
                    }
                    .font(.caption)
                    
                    Text("\(price)/month")
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                }
                
                Spacer()
            }
            
            if status == .complete {
                HStack {
                    Spacer()
                    Text("Rate your expirience")
                        .foregroundStyle(.white)
                        .padding(6)
                        .padding(.horizontal, 32)
                        .background(.green)
                        .clipShape(Capsule())
                        .onTapGesture {
                            rateExpirienceButtonPressed?()
                        }
                }
                
                
            } else if status == .cancelled {
                HStack {
                    Spacer()
                    Text("Re-Book")
                        .foregroundStyle(.white)
                        .padding(6)
                        .padding(.horizontal, 32)
                        .background(.blue)
                        .clipShape(Capsule())
                        .onTapGesture {
                            rebookButtonPressed?()
                        }
                }
                
            } else {
                HStack(spacing: 100) {
                    Text("Cancel")
                        .foregroundStyle(.white)
                        .padding(6)
                        .padding(.horizontal)
                        .background(.red)
                        .clipShape(Capsule())
                        .onTapGesture {
                            cancelButtonPressed?()
                        }
                    
                    Text("Reschedule")
                        .foregroundStyle(.white)
                        .padding(6)
                        .padding(.horizontal)
                        .background(.blue)
                        .clipShape(Capsule())
                        .onTapGesture {
                            rescheduleButtonPressed?()
                        }
                }
            }

            Divider()
        }
        .padding(.horizontal)
    }
}
