//
//  MapView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 17/07/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var mapViewmodel = MapViewmodel()
    @State private var propertyTapped: Bool = false
    @State private var selection: String?
    
    @State private var searchText: String = ""
    
    var body: some View {
        
        Map(position: $mapViewmodel.mapCameraPosition, selection: $selection) {
            ForEach(mapViewmodel.propertyLocations) { property in
                Marker(property.name, systemImage: "house.fill", coordinate: property.coordinates)
            }
        }
        .onChange(of: selection) {
            if selection != nil {
                propertyTapped.toggle()
            }
        }
        .sheet(isPresented: $propertyTapped, onDismiss: {mapViewmodel.mapCameraPosition = .automatic
            selection = nil
        }) {
            PropertyDetail()
                .presentationDetents([.medium, .large])
        }
        .safeAreaInset(edge: .top) {
            seachField
        }
    }
}

#Preview {
    NavigationStack {
        MapView()
    }
}


extension MapView {
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
                    .fill(.white.opacity(0.5))
                    .stroke(Color.primary, lineWidth: 1)
            }
            
            Image(systemName: "line.3.horizontal.decrease.circle")
                .foregroundStyle(.white)
                .font(.title2)
                .padding(8)
                .background(.blue)
                .cornerRadius(15)
        }
        .padding(.top, 10)
        .padding(.horizontal)
    }
}
