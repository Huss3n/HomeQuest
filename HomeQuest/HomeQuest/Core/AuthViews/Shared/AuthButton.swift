//
//  AuthButton.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct AuthButton: View {
    var title: String
    var action: () -> ()

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.blue)
                .cornerRadius(25)
        })
    }
}

#Preview {
    AuthButton(title: "Sign In", action: {})
}
