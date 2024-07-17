//
//  Splash.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct Splash: View {
    @Binding var onboardingState: Int
    
    var body: some View {
        VStack {
            Image("Group 1436")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            HStack(alignment: .center) {
                Image("logo")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(Color.blue)
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    
                Text("HomeQuest")
                    .font(.title2.bold())
                    .foregroundStyle(.blue)
            }
            
            Button(action: {
                onboardingState += 1
            }, label: {
                Text("Get Started")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.blue)
                    .cornerRadius(25)
            })
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

#Preview {
    Splash(onboardingState: .constant(1))
}
