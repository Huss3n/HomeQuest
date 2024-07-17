//
//  AddCardDetails.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 16/07/2024.
//

import SwiftUI

struct AddCardDetails: View {
    @Environment(\.dismiss) var dismiss
    @State private var cardHolderName: String = ""
    @State private var cardNumbers: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""
    @State private var saveCard: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 12) {
                inputTitle(title: "Card Holder Name")
                    .padding(.top, 32)
                inputField(placeholder: "Full Name", text: $cardHolderName)
                
                inputTitle(title: "Card Number")
                inputField(placeholder: "1234 5678 9876 5432", text: $cardNumbers)
                
                HStack {
                    VStack(alignment: .leading) {
                        inputTitle(title: "Expiry Date")
                        inputField(placeholder: "14/24", text: $expiryDate)
                    }
                    
                    VStack(alignment: .leading) {
                        inputTitle(title: "CVV")
                        inputField(placeholder: "000", text: $cvv)
                    }
                    
                }
                
                HStack {
                    Image(systemName: saveCard ? "rectangle.fill" : "rectangle")
                        .foregroundStyle(saveCard ? .blue : .black)
                        .overlay {
                            if saveCard {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                saveCard.toggle()
                            }
                        }
                    
                    Text("Save Card")
                }
                .font(.title3)
                .padding(.top, 12)
                
                Spacer()
                
                Text("Done")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.blue)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.bottom, 32)
                
            }
            .padding(.horizontal)
            .navigationTitle("Add Card")
            .navigationBarTitleDisplayMode(.inline)
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
    
    func inputTitle(title: String) -> some View {
        Text(title)
            .font(.headline)
    }
    
    func inputField(placeholder: String, text: Binding<String>) -> some View {
        HStack(alignment: .center, spacing: 16) {
            TextField(placeholder, text: text)
                .textContentType(.name)
        }
        .padding()
        .frame(height: 50)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primary, lineWidth: 0.5)
        }
    }
}

#Preview {
    AddCardDetails()
}
