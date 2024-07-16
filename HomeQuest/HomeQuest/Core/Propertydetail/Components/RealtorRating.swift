//
//  RealtorRating.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 16/07/2024.
//

struct RealtorReviewModel {
    var fullName: String
    var comment: String
    var ratingCount: Int
    var reviewLikeCount: Int
    var reviewDislikeCount: Int
}

import SwiftUI

struct RealtorRating: View {
    var realtorReviews: RealtorReviewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center) {
                Circle()
                    .fill(.gray.opacity(0.2))
                    .frame(width: 40, height: 40)
                    .overlay {
                        Image(systemName: "person.fill")
                    }
                
                Text("Hussein Aisak")
                    .font(.headline)
                
                Spacer()
                
                Text("2 months ago")
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
            }
            
            Text(realtorReviews.comment)
            
            HStack {
                ForEach(0..<realtorReviews.ratingCount, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
                Text("\(realtorReviews.ratingCount)")
                    .foregroundStyle(.gray)
                
                Spacer()
                
                HStack {
                    Text("Helpful?")
                    Image(systemName: "hand.thumbsup")
                        .onTapGesture {
                            // incr func
                        }
                    Text("\(realtorReviews.reviewLikeCount)")
                        .font(.caption)
                    
                    Image(systemName: "hand.thumbsdown")
                        .onTapGesture {
                            // decr func
                        }
                    Text("\(realtorReviews.reviewDislikeCount)")
                }
            }
            .font(.subheadline)
            
            Divider()
            
        }
    }
}


struct RealtorPreview: View {
    var realtor = RealtorReviewModel(
        fullName: "Hussein Aisak",
        comment: "Highly knowledgeable and professional. Made the buying process smooth and stress-free",
        ratingCount: 5,
        reviewLikeCount: 12,
        reviewDislikeCount: 3
    )
    
    var body: some View {
        RealtorRating(realtorReviews: realtor)
    }
}

#Preview {
    RealtorPreview()
}
