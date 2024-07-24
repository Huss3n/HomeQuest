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
    @State private var showProfile: Bool = false
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            NavigationStack {
                VStack (alignment: .leading, spacing: 12){
                    profileHeader
                    
                    ScrollView {
                        seachField
                        filterCapsules
                        featuredProperties
                        propertiesNearYou
                    }
                    .scrollIndicators(.hidden)
                    .fullScreenCover(isPresented: $showProfile, content: {
                        ProfileView()
                    })
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
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


extension HomeView {
    private var profileHeader: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Let's Find your")
                    .foregroundStyle(.gray)
                Text("Favorite Home")
                    .fontWeight(.semibold)
            }
            .font(.title2)
            
            Spacer()
            
            
            Image("pic1")
                .resizable()
                .frame(width: 50, height: 50)
                .scaledToFit()
                .clipShape(Circle())
                .onTapGesture {
                    showProfile.toggle()
                }
                
            
        }
    }
    
    private var seachField: some View {
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
            
            NavigationLink {
                SearchFilters()
                    .navigationBarBackButtonHidden()
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .padding(8)
                    .background(.blue)
                    .cornerRadius(15)
            }
            .tint(.primary)

        }
        .padding(.top, 10)
    }
    
    private var filterCapsules: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(filterButtons, id: \.self) { filter in
                    FilterButtons(title: filter, color: .blue, isSelected: selectedFilter == filter)
                        .onTapGesture {
                            selectedFilter = filter
                        }
                }
            }
            .padding(.top, 6)
        }
        .scrollIndicators(.hidden)
    }
    
    
    private var featuredProperties: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 2) {
                ForEach(0..<10) { _ in
                    NavigationLink {
                        PropertyDetail()
                            .navigationBarBackButtonHidden()
                        
                    } label: {
                        HouseDetail()
                    }
                    .tint(.primary)
                }
            }
            .padding(.top, 6)
        }
        .scrollIndicators(.hidden)
    }
    
    private var propertiesNearYou: some View {
        VStack {
            Text("Near You")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
            
            ForEach(0..<6) { _ in
                NavigationLink {
                    PropertyDetail()
                        .navigationBarBackButtonHidden()
                    
                } label: {
                    HouseRowDetail()
                }
                .tint(.primary)
            }
        }
    }
}
