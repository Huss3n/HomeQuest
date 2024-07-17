//
//  ReviewSummary.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 16/07/2024.
//

import SwiftUI

struct ReviewSummary: View {
    @Binding var realEstateButtonPressed: Bool
    @Environment(\.dismiss) var dismiss
    
    var date: Date = Date()
    
    private var formattedDate: String {
           let formatter = DateFormatter()
           formatter.dateFormat = "E, MMM d, h"
           return formatter.string(from: date)
       }
    
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .frame(height: 1)
                    .padding(.bottom)
                VStack {
                    HouseRowDetail()
                        .padding(.bottom, 12)
                    
                    VStack(spacing: 16) {
                        HStack {
                            Text("Booking date")
                            Spacer()
                            Text("\(formattedDate):00 AM")
                        }
                        
                        HStack {
                            Text("Check in")
                            Spacer()
                            Text("Wed, Jul 17, 3:00 PM")
                        }
                        
                        HStack {
                            Text("Duration")
                            Spacer()
                            Text("5 Days")
                        }
                    }
                    
                 
                    
                    Divider()
                    VStack(spacing: 20) {
                        HStack {
                            Text("Amount")
                            Spacer()
                            Text("Ksh 12,000")
                        }
                        
                        HStack {
                            Text("Tax")
                            Spacer()
                            Text("Ksh 300")
                        }
                        
                        HStack {
                            Text("Total")
                            Spacer()
                            Text("Ksh 12, 300")
                        }
                        .padding(.top, 32)
                    }
                    .padding(.bottom, 12)
                    
                    Divider()
                    
                    HStack {
                        Image("cash")
                        Text("Cash")
                        
                        Spacer()
                        
                        Text("Change")
                            .font(.headline)
                            .foregroundStyle(.blue)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                    .padding(.top, 8)
                    
                    Spacer()
                    
                    Text("Complete Payment")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.blue)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        .padding(.bottom, 32)
                        .onTapGesture {
                            realEstateButtonPressed.toggle()
                        }
                    
                }
                .navigationTitle("Review Summary")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ReviewSummary(realEstateButtonPressed: .constant(true))
}
