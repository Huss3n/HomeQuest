//
//  RealtorRevire.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 23/07/2024.
//

import SwiftUI

struct RealtorRevire: View {
    @Environment(\.dismiss) var dismiss
    @State private var detailedReview: String = ""
    @State private var userRating: Int = 0 // State variable for user rating
    @State private var reviewDone: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image("pic9")
                        .resizable()
                        .frame(height: 250)
                    
                    rating
                        .padding(.horizontal)
                 
                    Spacer()
                    
                    Text("Submit")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(userRating == 0 ? .gray : .blue)
                        .cornerRadius(25)
                        .padding(.bottom, 32)
                        .padding(.horizontal)
                        .onTapGesture {
                            guard userRating != 0 else { return }
                            
                            withAnimation(.bouncy) {
                                reviewDone.toggle()
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                dismiss()
                            }
                        }
                    
                }
                .ignoresSafeArea()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                            .padding(8)
                            .background(.white.opacity(0.6))
                            .clipShape(Circle())
                            .onTapGesture {
                                dismiss()
                            }
                    }
                }
                .blur(radius: reviewDone ? 4 : 0)
                
                VStack {
                    Image(systemName: "trophy")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.blue)
                        .clipShape(Circle())
                    
                    Text("Thank you! These reviews help keep the community informed")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                       
                }
                .font(.title3)
                .frame(height: 200)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.green.opacity(0.9))
                )
                .padding(.horizontal)
                .opacity(reviewDone ? 1 : 0)
                .offset(y: -100)
            }
           
        }
    }
}

#Preview {
    RealtorRevire()
}


extension RealtorRevire {
    private var rating: some View {
        VStack(spacing: 12)  {
            Image("pic4")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            Text("Hussein Aisak")
                .font(.headline)
            Text("Realtor")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Text("How was your expirience with Hussein?")
                .font(.headline)
            
            Text("Your overall rating")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            HStack {
                ForEach(1..<6) { index in
                    Image(systemName: index <= userRating ? "star.fill" : "star")
                        .font(.title)
                        .foregroundColor(index <= userRating ? .yellow : .gray)
                        .onTapGesture {
                            userRating = index
                        }
                }
            }
            
            Text("Add a detailed review")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 12)
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.gray.opacity(0.1))
                .stroke(Color.primary, lineWidth: 1.0)
                .frame(height: 100)
                .background {
                    VStack {
                        TextField("Comment", text: $detailedReview)
                            .padding(.horizontal)
                            .font(.subheadline)
                        
                        Spacer()
                    }
                    .padding(.top)
                }
             
            
        }
    }
}
