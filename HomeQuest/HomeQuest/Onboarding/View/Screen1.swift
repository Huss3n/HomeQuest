//
//  Screen1.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct Screen1: View {
    @Binding var onboardingState: Int
    
    var body: some View {
        VStack(spacing: 18) {
            Spacer()
            
            Image("Apartment rent-pana 1")
            
            Group {
                Text("Find and rent your next ") +
                Text("dream home").foregroundStyle(.blue) +
                Text(" effortlessly")
            }
            .font(.title)
            .multilineTextAlignment(.center)
            
            Text("Browse listings, schedule viewings, and secure your new home.")
                .multilineTextAlignment(.center)
            
            Spacer()
            Spacer()
            
            HStack {
                
                HStack(spacing: 30) {
                    Image(systemName: "smallcircle.filled.circle.fill")
                        .foregroundStyle(.blue)
                    Image(systemName: "smallcircle.filled.circle.fill")
                        .foregroundStyle(.gray)
                    Image(systemName: "smallcircle.filled.circle.fill")
                        .foregroundStyle(.gray)
                }
                .font(.caption)
                .frame(maxWidth: .infinity)
                
                Image(systemName: "arrow.right")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.blue)
                    .clipShape(Circle())
                    .onTapGesture {
                        onboardingState += 1
                    }
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
            
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    Screen1(onboardingState: .constant(2))
}
