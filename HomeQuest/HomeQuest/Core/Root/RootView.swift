//
//  RootView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct RootView: View {
    @AppStorage("userNotSignedIn") var userNotSignedIn: Bool = true
    
    var body: some View {
        Maintab()
            .fullScreenCover(isPresented: $userNotSignedIn, content: {
                LoginView()
            })
    }
}

#Preview {
    RootView()
}
