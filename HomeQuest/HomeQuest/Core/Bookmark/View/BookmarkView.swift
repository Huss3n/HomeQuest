//
//  BookmarkView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 21/07/2024.
//

import SwiftUI

struct BookmarkView: View {
    var body: some View {
        NavigationStack {
            List {
                bookmarkComponent(imageName: "pic1", propetyName: "Woodvale Groove", properyAmount: "50,000", propertyLocation: "Rainy road, Kileleshwa")
                
                bookmarkComponent(imageName: "pic2", propetyName: "Peaceful leads", properyAmount: "70,000", propertyLocation: "Sea bird, Lavington")
            }
            .listStyle(.plain)
            .navigationTitle("Bookmarks")
        }
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
