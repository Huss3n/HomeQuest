//
//  SwipeView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 18/07/2024.
//

import SwiftUI

struct SwipeView: View {
    @State private var selectedFilter: HeaderFilterButtons = .rent
    var mockData = MockData.propertyInfo
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
              header
                
                HeaderFilter(selectedFilter: $selectedFilter)
                    .background( Divider(), alignment: .bottom )
                
                Spacer()
            }
        }
    }
}

extension SwipeView {
    private var header: some View {
        HStack {
            Image(systemName: "arrow.uturn.left")
                .padding(8)
                .background(.blue.opacity(0.001))
                .onTapGesture {
                    // bring back the property
                }
            
            Text("HouseQuest")
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .font(.title2)
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

#Preview {
    SwipeView()
}
