//
//  PropertyHeartView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 19/07/2024.
//

import SwiftUI

struct PropertyCommentCapsule: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.yellow)
                .frame(width: 40, height: 40)
            
            Image(systemName: "house.fill")
                .foregroundStyle(.blue)
                .font(.system(size: 28))
                .overlay {
                    Image(systemName: "message.fill")
                        .foregroundStyle(.yellow)
                        .font(.headline)
                        .offset(y: 6)
                }
            
            
        }
    }
}

#Preview {
    PropertyCommentCapsule()
}
