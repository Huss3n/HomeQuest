//
//  Logo.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import SwiftUI

struct Logo: View {
    var body: some View {
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
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    Logo()
}
