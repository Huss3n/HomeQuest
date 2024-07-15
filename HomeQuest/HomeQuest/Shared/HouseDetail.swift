//
//  HouseDetail.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct HouseDetail: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image("house")
                .resizable()
                .scaledToFit()
                .frame(width: 223, height: 155)
                .cornerRadius(20)
            
            Text("Lorem House")
                .font(.title3.bold())
            
            
            Text("$340/month")
                .foregroundStyle(.blue)
            
            HStack {
                Image(systemName: "mappin")
                Text("Avenue, West Side")
                    .fontWeight(.light)
                
                Spacer()
                
                Image(systemName: "bookmark.fill")
                    .font(.title3)
                    .foregroundStyle(.blue)
                    .padding(8)
                    .background(.blue.opacity(0.1))
                    .clipShape(Circle())
            }
        }
        .frame(width: 223, height: 252)
        .padding(.horizontal)
        .shadow(radius: 10)
        .cornerRadius(20)
        
    }
}

#Preview {
    HouseDetail()
}
