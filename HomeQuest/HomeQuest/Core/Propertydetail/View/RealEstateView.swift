//
//  RealEstateView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 16/07/2024.
//

import SwiftUI

struct RealEstateView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorscheme
    @State private var selectedPayment: PaymentMethod = .cash
    @State private var addCardDetails: Bool = false
    @State private var addPhoneNumber: Bool = false
    
    @Binding var realEstateButtonPressed: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                // Cash
                paymentTitle(title: "Cash")
                paymentOption(payment: "Cash", imageName: false, icon: "cash", selection: .cash)
                    .onTapGesture {
                        selectedPayment = .cash
                    }
            
                // card
                paymentTitle(title: "Credit & Debit Card")
                paymentOption(payment: "Add New Card", imageName: false, icon: "card", selection: .card)
                    .onTapGesture {
                        selectedPayment = .card
                        addCardDetails = selectedPayment == .card
                    }
                
                paymentTitle(title: "More Payment Options")
                paymentOption(payment: "Paypal", imageName: false, icon: "paypal", selection: .paypal)
                    .onTapGesture {
                        selectedPayment = .paypal
                    }
                paymentOption(payment: "Mpesa", imageName: true, icon: "", selection: .mpesa)
                    .onTapGesture {
                        selectedPayment = .mpesa
                        addPhoneNumber = selectedPayment == .mpesa
                    }
                
                Spacer()
                
                if selectedPayment == .cash {
                    NavigationLink {
                        ReviewSummary(realEstateButtonPressed: $realEstateButtonPressed)
                            .navigationBarBackButtonHidden()
                        
                    } label: {
                        Text("Continue")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(.blue)
                            .cornerRadius(20)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 32)
                }
        
            }
            .padding(.horizontal)
            .navigationTitle("Payment Details")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $addCardDetails, content: {
                AddCardDetails()
                    .presentationDetents([.medium])
            })
            .sheet(isPresented: $addPhoneNumber, content: {
                AddPhoneNumber()
                    .presentationDetents([.medium])
            })
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
    RealEstateView(realEstateButtonPressed: .constant(true))
}


extension RealEstateView {
    
    private func paymentTitle(title: String) -> some View {
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
    }
    
    
    private func paymentOption(payment: String, imageName: Bool , icon: String, selection: PaymentMethod) -> some View {
        VStack(spacing: 12) {
            HStack {
                if imageName {
                    Image("mpesa")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                } else {
                    Image(icon)
                }
                Text(payment)
                
                
                Rectangle()
                    .fill(colorscheme == .dark ? .black : .white)
                    .frame(height: 30)
                
                    
                
                ZStack {
                    Image(systemName: "circle")
                      
                    Image(systemName: "circle.circle.fill")
                        .foregroundStyle(.blue)
                        .opacity(selectedPayment == selection ? 1 : 0)
                }
            }
            Rectangle()
                .frame(height: 1)
        }
    
    }
}
