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
            
            SwipeView()
                .tabItem {
                    Image(systemName: "heart")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "location.circle")
                }
            
            BookmarkView()
                .tabItem {
                    Image(systemName: "bookmark")
                }
        }
    }
}

#Preview {
    Maintab()
}
