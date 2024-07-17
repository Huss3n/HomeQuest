//
//  OnboardingView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct OnboardingView: View {
    @State var onboardingState: Int = 0
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    var body: some View {
        
        NavigationStack {
            if onboardingState == 0 {
                Splash(onboardingState: $onboardingState)
    //                .transition(transition)
                
            } else if onboardingState == 1 {
                Screen1(onboardingState: $onboardingState)
                    .transition(transition)
                
            }  else if onboardingState == 2 {
                Screen2(onboardingState: $onboardingState)
                    .transition(transition)
                
            }  else if onboardingState == 3 {
                Screen3(onboardingState: $onboardingState)
                    .transition(transition)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
