//
//  BookTour.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 16/07/2024.
//

import SwiftUI

final class BookTourVM: ObservableObject {
    @Published var selectedDate: Date = Date()
    
    var minimumDate: Date {
           return Calendar.current.startOfDay(for: Date())
       }
}


struct BookTour: View {
    @StateObject private var viewmodel = BookTourVM()
    @Environment(\.dismiss) var dismiss
    @Binding var tourButtonPressed: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 12) {
                propertImages
                propertyRating
                propertyName
                
               Text("Pick Date and Time")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                DatePicker("", selection: $viewmodel.selectedDate, in: viewmodel.minimumDate...)
                    .datePickerStyle(.wheel)
                
                
                Spacer()
                
                NavigationLink {
                    ReceivedBooking(tourButtonPressed: $tourButtonPressed, date: viewmodel.selectedDate)
                } label: {
                    Text("Submit")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.blue)
                        .cornerRadius(20)
                        .padding(.horizontal)
                }
                .tint(.primary)

                
                Spacer()
            }
            .ignoresSafeArea()
        }
       
    }
}

#Preview {
    BookTour(tourButtonPressed: .constant(true))
}


extension BookTour {
    private var propertImages: some View {
        ZStack(alignment: .top) {
            Image("house")
                .resizable()
                .scaledToFit()
            
            HStack {
                Image(systemName: "xmark")
                    .padding(12)
                    .background(.white)
                    .clipShape(Circle())
                    .onTapGesture {
                        tourButtonPressed.toggle()
                    }
                
                Spacer()
            }
            .padding()
        }
    }
    
    // MARK: propertyRating
    private var propertyRating: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
            Text("4.9 (6.8k review)")
            
            Spacer()
            
            Text("Apartment")
                .foregroundStyle(.blue)
                .padding(10)
                .background(.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
        }
        .foregroundStyle(.gray)
        .padding(.horizontal)
    }
    
    // MARK: propertyName
    private var propertyName: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Woodland Apartment")
            Text("Ocean Avenue, Kileleshwa.")
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}
