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
                        
                    } label: {
                        listItems(imageName: "person", listName: "Edit Profile")
                        
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        listItems(imageName: "house", listName: "My Bookings")
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        listItems(imageName: "heart", listName: "Liked Properties")
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        listItems(imageName: "key", listName: "Change password")
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
