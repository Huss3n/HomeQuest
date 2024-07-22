//
//  ProfileView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 21/07/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var activityStatus: Bool = true
    @State private var logoutTapped: Bool = false
    let url: URL = URL(string: "https://t.ly/4-8Vt")!
    
    
    // Password fields
    @State private var changePassword: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center, spacing: 12) {
                    WebImage(url: url) { image in
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                    } placeholder: {
                        ProgressView()
                            .frame(width: 60, height: 60)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Hussein Aisak")
                            .font(.headline)
                        HStack(spacing: 4) {
                            Image(systemName: "circle.fill")
                                .foregroundStyle(activityStatus ? .green : .gray)
                            Text(activityStatus ? "Online" : "Offline")
                            
                            Image(systemName: activityStatus ? "eye" : "eye.slash")
                                .padding(.leading, 20)
                                .onTapGesture {
                                    activityStatus.toggle()
                                }
                        }
                        .font(.subheadline)
                        Text("Realtor")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                .padding()
                
                List {
                    NavigationLink {
                        RecentChats()
                    } label: {
                        listItems(imageName: "message", listName: "Chats")
                    }

                    
                    NavigationLink {
                        Text("Edit Profile")
                    } label: {
                        listItems(imageName: "person", listName: "Edit Profile")
                        
                    }
                    
                    NavigationLink {
                        Text("My Bookings")
                    } label: {
                        listItems(imageName: "house", listName: "My Bookings")
                    }
                    
                    NavigationLink {
                        LikedProperties()
                    } label: {
                        listItems(imageName: "heart", listName: "Liked Properties")
                    }
                    
                    listItems(imageName: "key", listName: "Change password")
                        .onTapGesture {
                            changePassword.toggle()
                        }
                    
                    NavigationLink {
                        
                    } label: {
                        listItems(imageName: "bell", listName: "Notifications")
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "lock")
                            Text("Account Type")
                            Spacer()
                            
                            Text("Realtor")
                                .foregroundStyle(.gray)
                                .font(.subheadline)
                        }
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        listItems(imageName: "iphone", listName: "Device Permisions")
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        listItems(imageName: "accessibility", listName: "Accessibility")
                    }
                    
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Logout")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .foregroundStyle(.red)
                    .onTapGesture {
                        logoutTapped.toggle()
                    }
                    
                }
                .listStyle(.plain)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "xmark.circle")
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            .confirmationDialog("", isPresented: $logoutTapped, actions: {
                Button("Cancel", role: .cancel, action: {})
                Button("Logut", role: .destructive, action: {
                    UserDefaults.standard.setValue(true, forKey: "userNotSignedIn")
                })
            }, message: {
                Text("Are you sure you want to logout?")
            })
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .animation(.smooth, value: activityStatus)
            .sheet(isPresented: $changePassword, content: {
                ChangePasswordView()
                    .presentationDetents([.medium])
            })
        }
    }
    
    private func listItems(imageName: String, listName: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .font(.title2)
            Text(listName)
        }
    }
}

#Preview {
    ProfileView()
}


struct ChangePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmNewPassword: String = ""
    @FocusState private var currentPasswordIsFocused: Bool
    @FocusState private var newPasswordIsFocused: Bool
    @FocusState private var confirmPasswordIsFocused: Bool
    
    // password errors
    @State private var errorMessage: String = ""
    @State private var wrongPassword: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                SecureField("Current Password", text: $currentPassword)
                    .textContentType(.password)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 1.0)
                    }
                    .focused($currentPasswordIsFocused)
                    .onSubmit {
                        newPasswordIsFocused = true
                    }
                
                SecureField("New Password", text: $newPassword)
                    .textContentType(.password)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black, lineWidth: 1.0)
                    }
                    .focused($newPasswordIsFocused)
                    .onSubmit {
                        confirmPasswordIsFocused = true
                    }
                
                SecureField("Confirm New Password", text: $confirmNewPassword)
                    .textContentType(.password)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black, lineWidth: 1.0)
                    }
                    .focused($confirmPasswordIsFocused)
                
                Text(errorMessage)
                    .font(.subheadline)
                    .foregroundStyle(wrongPassword ? .red : .green)
                
                Text("Done")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal, 30)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onTapGesture {
                        if currentPassword != "qwerty" {
                            wrongPassword.toggle()
                            errorMessage = "Current Pssword is wrong"
                        }else {
                            wrongPassword.toggle()
                            errorMessage = "Password update successful"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                dismiss()
                            }
                        }
                    }
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Change Password")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                currentPasswordIsFocused = true
            }
        }
    }
}
