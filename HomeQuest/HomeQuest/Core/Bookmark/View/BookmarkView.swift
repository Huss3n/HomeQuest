//
//  BookmarkView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 21/07/2024.
//

import SwiftUI

// ap id = 6394103
// access key = VMKmPkbFvktEZYnsT6_xy1F0ZStjzTadndsccvvs1wnayKCWMI
// secret key = mlPI3bsfdvP3AAPYVcQfj1dfdf6BsBqfu3o8hnNcoR3-Cc74vf4

struct BookmarkView: View {
    @State private var bookmarkedProperties: [PropertyMockDataModel] = MockData.bookmarkedProperties
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                if bookmarkedProperties.isEmpty {
                    ContentUnavailableView("No bookmarked properties!", systemImage: "bookmark", description: Text("Your bookmarked properties will appear here"))
                } else {
                    List {
                        ForEach(bookmarkedProperties) { property in
                            
                            NavigationLink {
                                PropertyDetail()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                bookmarkComponent(imageName: property.imageName, propetyName: property.propertyName, properyAmount: property.propertyAmount, propertyLocation: property.propertyLocation)
                            }
                        }
                        .onDelete(perform: delete)
                    }
                    .toolbar {
                        ToolbarItem {
                            EditButton()
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Bookmarks")
   
        }
    }
    
    func delete(index: IndexSet) {
        bookmarkedProperties.remove(atOffsets: index)
    }
}

#Preview {
    BookmarkView()
}

extension BookmarkView {
    private func bookmarkComponent(imageName: String, propetyName: String, properyAmount: String, propertyLocation: String) -> some View {
        HStack(spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .cornerRadius(20)
            VStack(alignment: .leading, spacing: 6) {
                Text(propetyName)
                    .font(.headline)
                Text("Ksh \(properyAmount)/month")
                    .font(.subheadline)
                    .foregroundStyle(.blue)
                
                HStack(spacing: 4) {
                    Image(systemName: "mappin.and.ellipse.circle")
                    Text(propertyLocation)
                }
                .font(.caption)
            }
        }
    }
}
