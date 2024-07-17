//
//  HouseRowDetail.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct HouseRowDetail: View {
    var body: some View {
        VStack {
            HStack {
                Image("house")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: 89, height: 90)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text("4.9")
                        
                        Spacer()
                        
                        Text("Apartment")
                            .foregroundStyle(.blue)
                            .font(.subheadline)
                            .padding(6)
                            .background(.blue.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    Text("Woodland Apartment")
                        .font(.headline)
                    HStack {
                        Image(systemName: "mappin")
                        Text("1012 Ocean Avenue, New York, USA")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                    HStack {
                        Image("size")
                        Text("1,225")
                        
                        Image("room")
                        Text("3")
                        
                        Spacer()
                        
                        Text("Ksdh50,000/ month")
                            .font(.subheadline)
                            .foregroundStyle(.blue)
                    }
                }
                .font(.subheadline)
            }
            Rectangle()
                .fill(.blue)
                .frame(height: 0.6)
        }
 
    }
}

#Preview {
    HouseRowDetail()
        .padding(.horizontal)
}
