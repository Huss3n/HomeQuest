//
//  RegisterView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @FocusState var emailIsFocused: Bool
    @FocusState var usernameIsFocused: Bool
    @FocusState var passwordIsFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Logo()
            Text("Create Account")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 12)
            
            Text("Email")
            emailField
            
            Text("Username")
            usernameField
            
            Text("Password")
            passwordField
            
            AuthButton(title: "Create Account", action: { })
            
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
            emailIsFocused = true
        }
    }
}

#Preview {
    RegisterView()
}


extension RegisterView {
    
    private var emailField: some View {
        // MARK: Email
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "envelope")
                .foregroundStyle(.gray)
            TextField("Email", text: $email)
                .textContentType(.emailAddress)
                .textContentType(.emailAddress)
                .focused($emailIsFocused)
                .onSubmit {
                    usernameIsFocused = true
                }
        }
        .padding()
        .frame(height: 51)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primary, lineWidth: 0.5)
        }
    }
    
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
                    .onSubmit {
                        passwordIsFocused = false
                    }
                
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .focused($passwordIsFocused)
                    .opacity(showPassword ? 0 : 1)
                    .onSubmit {
                        passwordIsFocused = false
                    }
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
