//
//  BookNowPopUp.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 16/07/2024.
//

import SwiftUI

struct BookNowPopUp: View {
    @Binding var bookingOption: BookingOptions
    var action: () -> ()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Booking options")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 32)
            
            HStack(spacing: 30) {
                
                Button(action: {
                    bookingOption = .tour
                    action()
                }, label: {
                    Text("Tour")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 140, height: 45)
                        .background(.blue)
                        .cornerRadius(20)
                })
                
                Button(action: {
                    bookingOption = .realEstate
                    action()
                }, label: {
                    Text("Real Estate")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 140, height: 45)
                        .background(.green)
                        .cornerRadius(20)
                })
            }
            
            Spacer()
        }
        .clipShape(.rect(topLeadingRadius: 40, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 40))
    }
}

#Preview {
    BookNowPopUp(bookingOption: .constant(.realEstate), action: {})
}
