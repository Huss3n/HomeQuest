//
//  RealtorView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 19/07/2024.
//

import SwiftUI

struct RealtorView: View {
    var user: UserModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Listing Agent")
                .font(.headline)
                .fontWeight(.semibold)
            
            HStack(spacing: 12) {
                Image("pic1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaledToFit()
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(user.fullName)
                        .fontWeight(.semibold)
                    Text("Realtor")
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                HStack(spacing: 30) {
                    Image("email")
                    Image("phone")
                }
            }
        }
    }
}


struct RealtorViewPreview: View {
    var user = MockData.userData
    var body: some View {
        RealtorView(user: user)
    }
}

#Preview {
    RealtorViewPreview()
}
