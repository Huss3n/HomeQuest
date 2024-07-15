//
//  Screen2.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct Screen2: View {
    @Binding var onboardingState: Int
    
    var body: some View {
        VStack(spacing: 18) {
            Spacer()
            
            Image("Frame 1171275471")
            
            Group {
                Text("Discover properties in your  ") +
                Text("desired area").foregroundStyle(.blue) +
                Text(" easily")
            }
            .font(.title)
            .multilineTextAlignment(.center)
            
            Text("Use our interactive map to locate homes that meet your needs.")
                .multilineTextAlignment(.center)
            
            Spacer()
            Spacer()
            
            HStack {
                Image(systemName: "arrow.left")
                    .font(.headline)
                    .foregroundStyle(.blue)
                    .padding()
                    .background(.white)
                    .overlay {
                        Circle()
                            .stroke(Color.blue, lineWidth: 1.0)
                    }
                    .onTapGesture {
                        onboardingState -= 1
                    }
                
                HStack(spacing: 30) {
                    Image(systemName: "smallcircle.filled.circle.fill")
                        .foregroundStyle(.gray)
                    Image(systemName: "smallcircle.filled.circle.fill")
                        .foregroundStyle(.blue)
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
    Screen2(onboardingState: .constant(3))
}
