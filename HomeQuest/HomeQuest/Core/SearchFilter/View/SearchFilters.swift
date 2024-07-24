//
//  SearchFilters.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 23/07/2024.
//

import SwiftUI

enum Stars {
    case five
    case four
    case three
    case two
}

enum Bedrooms: CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    
    var name: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6 +"
        }
    }
}

struct SearchFilters: View {
    @Environment(\.dismiss) var dismiss
    @State private var allFilters: [String] = ["All", "House", "Villa", "Apartment"]
    @State private var selectedFilter: String = "All"
    @State private var priceRange: Double = 500
    @State private var selectedRating: Int = 0
    @State private var selectedStar: Stars? = nil
    @State private var selectedBedroom: Bedrooms = .one
    @State private var selectedBathroom: Bedrooms = .one
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Category")
                    .font(.headline)
                
                filterButton
                slider
                starFilters
                bedroom
                bathroom
                
                Spacer()
                
                HStack {
                    Text("Reset Filter")
                        .foregroundStyle(.white)
                        .padding(10)
                        .padding(.horizontal)
                        .background(.red)
                        .cornerRadius(20)
                        .onTapGesture {
                            dismiss()
                        }
                    
                    Spacer()
                    
                    Text("Apply Filter")
                        .foregroundStyle(.white)
                        .padding(10)
                        .padding(.horizontal)
                        .background(.blue)
                        .cornerRadius(20)
                        .onTapGesture {
                            dismiss()
                        }
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
            .navigationTitle("Filter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "arrow.left")
                        .onTapGesture {
                            dismiss()
                        }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}

#Preview {
    SearchFilters()
}


extension SearchFilters {
    private var filterButton: some View {
        HStack {
            ForEach(allFilters, id: \.self) { filter in
                Text(filter)
                    .font(.headline)
                    .foregroundStyle((selectedFilter == filter ? Color.white : Color.black))
                    .padding(8)
                    .padding(.horizontal, 10)
                    .background(selectedFilter == filter ? Color.blue : Color.gray.opacity(0.3))
                    .cornerRadius(20)
                    .onTapGesture {
                        selectedFilter = filter
                    }
            }
            
        }
    }
    
    private var slider: some View {
        VStack(alignment: .leading) {
            Text("Price range")
                .font(.headline)
            
            Slider(value: $priceRange, in: 100...5000, step: 100)
                .accentColor(.blue)
                .padding(.horizontal, 20)
            HStack {
                Text("20k")
                Spacer()
                Text("50k")
                Spacer()
                Text("80k")
                Spacer()
                Text("100k")
                Spacer()
                Text("150k")
                Spacer()
                Text("200k+")
            }
            .font(.subheadline)
        }
    }
    
    private var starFilters: some View {
        VStack(alignment: .leading) {
            Text("Reviews")
                .font(.headline)
                .padding(.top, 12)
                .padding(.bottom, 18)
            
            VStack(spacing: 20) {
                HStack {
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                    
                    Spacer()
                    
                    Image(systemName: selectedStar == .five ? "circle.fill" : "circle")
                        .foregroundStyle(.blue)
                        .onTapGesture {
                            selectedStar = .five
                        }
                }
                
                HStack {
                    ForEach(0..<4) { _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                    Spacer()
                    
                    Image(systemName: selectedStar == .four ? "circle.fill" : "circle")
                        .foregroundStyle(.blue)
                        .onTapGesture {
                            selectedStar = .four
                        }
                }
                
                HStack {
                    ForEach(0..<3) { _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                    
                    Spacer()
                    
                    Image(systemName: selectedStar == .three ? "circle.fill" : "circle")
                        .foregroundStyle(.blue)
                        .onTapGesture {
                            selectedStar = .three
                        }
                }
                
                HStack {
                    ForEach(0..<2) { _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                    
                    Spacer()
                    
                    Image(systemName: selectedStar == .two ? "circle.fill" : "circle")
                        .foregroundStyle(.blue)
                        .onTapGesture {
                            selectedStar = .two
                        }
                }
            }
            
            
        }
    }
    
    private var bedroom: some View {
        VStack (alignment: .leading, spacing: 12) {
            
            Text("Bedrooms")
                .font(.headline)
            
            HStack {
                ForEach(Bedrooms.allCases, id: \.self) { filter in
                    Text(filter.name)
                        .font(.headline)
                        .foregroundStyle((selectedBedroom == filter ? Color.white : Color.black))
                        .padding(8)
                        .padding(.horizontal, 10)
                        .background(selectedBedroom == filter ? Color.blue : Color.gray.opacity(0.3))
                        .cornerRadius(20)
                        .onTapGesture {
                            selectedBedroom = filter
                        }
                }
            }
            
        }
    }
    
    private var bathroom: some View {
        VStack (alignment: .leading, spacing: 12) {
            
            Text("Bathrooms")
                .font(.headline)
            
            HStack {
                ForEach(Bedrooms.allCases, id: \.self) { filter in
                    Text(filter.name)
                        .font(.headline)
                        .foregroundStyle((selectedBathroom == filter ? Color.white : Color.black))
                        .padding(8)
                        .padding(.horizontal, 10)
                        .background(selectedBathroom == filter ? Color.blue : Color.gray.opacity(0.3))
                        .cornerRadius(20)
                        .onTapGesture {
                            selectedBathroom = filter
                        }
                }
            }
            
        }
    }
}
