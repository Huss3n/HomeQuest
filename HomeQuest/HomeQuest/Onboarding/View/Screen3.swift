//
//  Screen3.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct Screen3: View {
    @Binding var onboardingState: Int
    @State private var navigateToLogin: Bool = false
  
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 18) {
                Spacer()
                Image("Frame 1171275472")
                
                Group {
                    Text("Manage your real estate ") +
                    Text("schedule").foregroundStyle(.blue) +
                    Text(" with ease")
                }
                .font(.title)
                .multilineTextAlignment(.center)
                
                Text("Book viewings, set reminders, and never miss an appointment..")
                    .multilineTextAlignment(.center)
                
                Spacer()
                Spacer()
                
                HStack {
                    Image(systemName: "arrow.left")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .padding()
                        .background(.white)
                        .overlay {
                            Circle()
                                .stroke(Color.blue, lineWidth: 1.0)
                        }
                        .onTapGesture {
                            onboardingState -= 1
                        }
                    
                    HStack(spacing: 30) {
                        Image(systemName: "smallcircle.filled.circle.fill")
                            .foregroundStyle(.gray)
                        Image(systemName: "smallcircle.filled.circle.fill")
                            .foregroundStyle(.gray)
                        Image(systemName: "smallcircle.filled.circle.fill")
                            .foregroundStyle(.blue)
                    }
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                    
                    Image(systemName: "arrow.right")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.blue)
                        .clipShape(Circle())
                        .onTapGesture {
                            navigateToLogin.toggle()
                            
                            // set onboarding flag as complete
                            UserDefaults.standard.setValue(true, forKey: "onboardingComplete")
                        }
                }
                .frame(maxWidth: .infinity, alignment: .bottom)
              
            }
            .padding(.horizontal)
            .navigationDestination(isPresented: $navigateToLogin, destination: {
                LoginView()
                    .navigationBarBackButtonHidden()
            })
        }
    }
}

#Preview {
    Screen3(onboardingState: .constant(4))
}
