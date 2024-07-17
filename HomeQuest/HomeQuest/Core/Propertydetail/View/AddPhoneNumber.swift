//
//  AddPhoneNumber.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 16/07/2024.
//

import SwiftUI

struct AddPhoneNumber: View {
    @Environment(\.dismiss) var dismiss
    @State private var phoneNumber: String = ""
    @FocusState private var phoneNumberIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                HStack(alignment: .center, spacing: 16) {
                    TextField("0712 000 000", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .focused($phoneNumberIsFocused)
                }
                .padding()
                .frame(height: 50)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 0.5)
                }
                .padding(.top, 12)
        
                Text("Done")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.blue)
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Enter Phone number")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
            .onAppear {
                phoneNumberIsFocused = true
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "xmark.circle")
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}

#Preview {
    AddPhoneNumber()
}
