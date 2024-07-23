//
//  CancelBooking.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 23/07/2024.
//

import SwiftUI

enum CancelReason: CaseIterable {
    case changeInPlans
    case financingProblems
    case unexpectedWork
    case personalPreferences
    case other
    
    var reasonString: String {
        switch self {
        case .changeInPlans:
            return "Change in Plans"
        case .financingProblems:
            return "Financing Problems"
        case .unexpectedWork:
            return "Unexpected work"
        case .personalPreferences:
            return "Personal Preference"
        case .other:
            return "Other"
        }
    }
}

struct CancelBooking: View {
    @Environment(\.dismiss) var dismiss
    @State private var cancelReason: CancelReason? = nil
    @State private var otherReason: String = ""
    
    @State private var appointmentCancelled: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading, spacing: 18) {
                    Text("Please select the reason for cancellation:")
                        .font(.headline)
                    
                    ForEach(CancelReason.allCases, id: \.self) { reason in
                        HStack {
                            Image(systemName: cancelReason == reason ? "circle.circle.fill" : "circle")
                            
                            Text(reason.reasonString)
                        }
                        .onTapGesture {
                            cancelReason = reason
                        }
                    }
                
                    
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(.gray.opacity(0.1))
                        .stroke(Color.primary, lineWidth: 1.0)
                        .frame(height: 100)
                        .background {
                            VStack {
                                TextField("Enter your reason", text: $otherReason)
                                     .padding(.horizontal)
                                     .font(.subheadline)
                                
                                Spacer()
                            }
                            .padding(.top)
                        }
                    
                    Spacer()
                    
                    Text("Cancel Appointment")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(cancelReason == nil ? .gray : .blue)
                        .cornerRadius(25)
                        .padding(.bottom, 32)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                appointmentCancelled.toggle()
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                                dismiss()
                            }
                        }
                    
                        
                    
                }
                .toolbar {
                    ToolbarItem {
                        Image(systemName: "xmark.circle")
                            .onTapGesture {
                                dismiss()
                            }
                    }
                }
                .padding(.top, 12)
                .padding(.horizontal)
                .navigationTitle("Cancel Booking")
                .navigationBarTitleDisplayMode(.inline)
                
                
                Text("Appointment cancelled sucussfuly!")
                    .foregroundStyle(.green)
                    .font(.headline)
                    .offset(y: 20)
                    .opacity(appointmentCancelled ? 1 : 0)
            }
        }
    }
}

#Preview {
    CancelBooking()
}
