//
//  HomeView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var selectedFilter: String = "Recomended"
    var filterButtons: [String] = ["Recomended", "Top Rates", "Best Offers"]
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack (alignment: .leading, spacing: 12){
                HStack {
                    VStack(alignment: .leading) {
                        Text("Let's Find your")
                            .foregroundStyle(.gray)
                        Text("Favorite Home")
                            .fontWeight(.semibold)
                    }
                    .font(.title2)
                    
                    Spacer()
                    
                    Circle()
                        .fill(.gray.opacity(0.5))
                        .frame(width: 60, height: 60)
                }
                
                
                ScrollView {
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search by Address or City", text: $searchText)
                        }
                        .padding()
                        .frame(height: 50)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary, lineWidth: 0.5)
                        }
                        
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundStyle(.white)
                            .font(.title2)
                            .padding(8)
                            .background(.blue)
                            .cornerRadius(15)
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(filterButtons, id: \.self) { filter in
                                FilterButtons(title: filter, color: .blue, isSelected: selectedFilter == filter)
                                    .onTapGesture {
                                        selectedFilter = filter
                                    }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) { _ in
                                HouseDetail()
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                    Text("Near You")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                     
                    ForEach(0..<10) { _ in
                        HouseRowDetail()
                    }
                    
                }
                .scrollIndicators(.hidden)
     
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HomeView()
//    FilterButtons(color: .blue)
}


struct FilterButtons: View {
    var title: String
    var color: Color
    var isSelected: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(isSelected ? color.opacity(0.1) : Color.gray.opacity(0.1))
            .frame(width: 130, height: 40)
            .overlay {
              Text(title)
                    .font(.headline)
                    .foregroundStyle(isSelected ? color : .gray)
            }
    }
}
