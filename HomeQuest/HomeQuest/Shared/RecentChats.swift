//
//  RecentChats.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 22/07/2024.
//

import SwiftUI

struct RecentChats: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    NavigationLink {
                        ChatView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(alignment: .center) {
                            Image("pic5")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Jonh Doe")
                                    .font(.headline)
                                Text("Active: 2 hours ago")
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                    }
                    .tint(.primary)
                    
                }
                .navigationTitle("Recent Chats")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal)
                .padding(.top, 32)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
    }
}

#Preview {
    RecentChats()
}
