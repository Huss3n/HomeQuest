//
//  ImageLoader.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 18/07/2024.
//

import SwiftUI

struct ImageLoader: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ZStack {
                    Image("house")
                        .resizable()
                }
                .frame(height: 600)
                .scaledToFit()
            }
            
     
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ImageLoader()
}
