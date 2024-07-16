//
//  PropertyCapsule.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct PropertyCapsule: View {
    @Environment(\.colorScheme) var colorScheme
    var imageName: String
    var count: Int?
    var title: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(colorScheme == .light ? .white : .white.opacity(0.1))
            .frame(width: 85, height: 78)
                .shadow(radius: 6)
                .overlay {
                    VStack(alignment: .center, spacing: 4) {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.blue)
                            .frame(width: 20, height: 20)
                        
                        if let count = count {
                            Text("\(count)")
                                .font(.subheadline)
                                .foregroundStyle(.blue)
                            
                        }
                      
                        Text(title)
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                            .lineLimit(2)
                    }
                    
                }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.1).ignoresSafeArea()
        PropertyCapsule(imageName: "car", title: "Car Parking")
    }
    
  
}
