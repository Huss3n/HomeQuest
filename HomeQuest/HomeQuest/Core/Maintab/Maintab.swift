//
//  Maintab.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct Maintab: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "location.circle")
                }
            
            Text("My Bookmarks")
                .tabItem {
                    Image(systemName: "bookmark")
                }
            
            Text("My Profile")
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    Maintab()
}
