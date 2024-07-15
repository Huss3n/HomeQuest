//
//  LoginView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @FocusState var usernameIsFocused: Bool
    @FocusState var passwordIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                // MARK: Logo
               Logo()
                Text("Sign In")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 12)
                
                Text("Username")
                usernameField
                
                Text("Password")
                passwordField
                
                
                NavigationLink("Create Account") {
                    RegisterView()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                AuthButton(title: "Sign In", action: { })
                
                HStack {
                    Rectangle()
                        .frame(width: 60, height: 1)
                    Text("Or continue with")
                    Rectangle()
                        .frame(width: 60, height: 1)
                }
                .foregroundStyle(.gray)
                .font(.callout)
                .frame(maxWidth: .infinity, alignment: .center)
                
                Image("ios_dark_sq_na")
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
            }
            .padding(.top, 32)
            .padding(.horizontal)
            .onAppear {
                usernameIsFocused = true
            }
        }
    }
}

#Preview {
    LoginView()
}


extension LoginView {
    
    private var usernameField: some View {
        // MARK: Username
        HStack(alignment: .center, spacing: 16) {
            Image("person")
            TextField("Username", text: $username)
                .textContentType(.name)
                .focused($usernameIsFocused)
                .onSubmit {
                    passwordIsFocused = true
                }
        }
        .padding()
        .frame(height: 51)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primary, lineWidth: 0.5)
        }
    }
    
    private var passwordField: some View {
        HStack(alignment: .center, spacing: 16) {
            Image("key")
            ZStack {
                TextField("Password", text: $password)
                    .textContentType(.password)
                    .focused($passwordIsFocused)
                    .opacity(showPassword ? 1 : 0)
                
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .focused($passwordIsFocused)
                    .opacity(showPassword ? 0 : 1)
            }
            
            Image(systemName: showPassword ? "eye" : "eye.slash")
                .onTapGesture {
                    showPassword.toggle()
                }
        }
        .padding()
        .frame(height: 51)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primary, lineWidth: 0.5)
        }
    }
}
