//
//  PropertyHeartView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 19/07/2024.
//

import SwiftUI

struct PropertyHeartView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.yellow)
                .frame(width: 45, height: 45)
            
            Image(systemName: "house.fill")
                .font(.system(size: 26))
                .offset(y: 2)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.yellow)
                .font(.system(size: 14))
                .offset(y: 6)
        }
    }
}

#Preview {
    PropertyHeartView()
}
