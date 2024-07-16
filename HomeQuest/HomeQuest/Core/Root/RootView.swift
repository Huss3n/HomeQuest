//
//  RootView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct RootView: View {
    @AppStorage("userNotSignedIn") var userNotSignedIn: Bool = true
    @AppStorage("onboardingComplete") var onboardingComplete: Bool = false
    
    var body: some View {
        
        if !onboardingComplete {
            OnboardingView()
            
        } else {
            Maintab()
                .fullScreenCover(isPresented: $userNotSignedIn, content: {
                    LoginView()
                })
        }
    }
}

#Preview {
    NavigationStack {
        RootView()
    }
}
