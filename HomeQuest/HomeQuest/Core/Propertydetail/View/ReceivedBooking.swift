//
//  ReceivedBooking.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 16/07/2024.
//

import SwiftUI

struct ReceivedBooking: View {
    @Environment(\.dismiss) var dismiss
    @Binding var tourButtonPressed: Bool
    var date: Date
    
    private var formattedDate: String {
           let formatter = DateFormatter()
           formatter.dateFormat = "E, MMM d, h:mm a"
           return formatter.string(from: date)
       }
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Circle()
                .fill(.blue)
                .frame(width: 100, height: 100)
                .overlay {
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            Text("Request received!")
                .font(.title)
                .fontWeight(.bold)
            
            Text("We're checking if the home can be seen on")
            Text(formattedDate)
                .font(.headline)
            
            VStack(alignment: .leading) {
                Text("Agent responsible for the tour:")
                HStack(spacing: 12) {
                    Image("pic1")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("Hussein Aiak")
                            .fontWeight(.semibold)
                        Text("Realtor")
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 30) {
                        Image("email")
                        Image("phone")
                    }
                }
            }
            .padding(.top, 32)
            
            Spacer()
            
            Text("Done")
                .foregroundStyle(.white)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.blue)
                .cornerRadius(20)
                .padding(.horizontal)
                .onTapGesture {
                    tourButtonPressed.toggle()
                }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ReceivedBooking(tourButtonPressed: .constant(true), date: Date())
}
