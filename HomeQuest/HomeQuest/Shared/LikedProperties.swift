//
//  LikedProperties.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 22/07/2024.
//

import SwiftUI

struct LikedProperties: View {
    @State private var likedProperties: [PropertyMockDataModel] = MockData.bookmarkedProperties
    
    var body: some View {
        NavigationStack {
            VStack {
                if likedProperties.isEmpty {
                    ContentUnavailableView("No liked properties!", systemImage: "heart.fill", description: Text("Your liked properties will appear here"))
                } else {
                    List {
                        ForEach(likedProperties.indices, id: \.self) { index in
                            NavigationLink {
                                PropertyDetail()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                likedComponent(property: likedProperties[index], index: index)
                            }
                        }
                        .onDelete(perform: delete)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Liked Properties")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func delete(at offsets: IndexSet) {
        likedProperties.remove(atOffsets: offsets)
    }
}

#Preview {
    LikedProperties()
}

extension LikedProperties {
    private func likedComponent(property: PropertyMockDataModel, index: Int) -> some View {
        ZStack {
            HStack(spacing: 10) {
                Image(property.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(property.propertyName)
                        .font(.headline)
                    Text("Ksh \(property.propertyAmount)/month")
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "mappin.and.ellipse.circle")
                        Text(property.propertyLocation)
                    }
                    .font(.caption)
                }
                
                Spacer()
            }
            
            Image(systemName: "heart.fill")
                .font(.title2)
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .topTrailing)
                .offset(y: -20)
                .onTapGesture {
                    likedProperties.remove(at: index)
                }
        }
    }
}
