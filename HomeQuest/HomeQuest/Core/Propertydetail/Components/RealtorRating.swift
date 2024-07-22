//
//  RealtorRating.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 16/07/2024.
//
import SwiftUI


struct RealtorReviewModel: Identifiable {
    var id = UUID().uuidString
    var fullName: String
    var comment: String
    var ratingCount: Int
    var reviewLikeCount: Int
    var reviewDislikeCount: Int
}


final class RealtorRatingViewmodel: ObservableObject {
    @Published var reviews: [RealtorReviewModel] = []
    
    init() {
        generateRandomReviews()
    }
    
    private func generateRandomReviews() {
        let names = [
            "Hussein Aisak", "Bob Smith", "Charlie Brown", "Daisy Miller",
            "Eve Davis", "Frank Wilson", "Grace Lee", "Hank Martinez",
            "Ivy Anderson", "Jack Taylor", "Katy Harris", "Liam Clark",
            "Mia Lewis", "Noah Walker", "Olivia Young", "Paul King",
            "Quinn Wright", "Rachel Scott", "Sam Green", "Tina Adams"
        ]
        
        let comments = [
            "Excellent service! Very professional and helpful throughout the process.",
            "Had a great experience. The realtor was very knowledgeable and friendly.",
            "The buying process was smooth and hassle-free. Highly recommend!",
            "Professional and responsive. Made the whole process stress-free.",
            "Very satisfied with the service. The realtor was attentive to all details.",
            "Good experience overall. The realtor was helpful but could improve communication.",
            "The process took longer than expected. Communication could be better.",
            "Great realtor. Very patient and answered all our questions.",
            "Service was okay, but there were a few issues with the paperwork.",
            "The realtor was very dedicated but seemed overwhelmed at times.",
            "Excellent support throughout the buying process. Would use again.",
            "The realtor was helpful but missed a few details. Overall, satisfied.",
            "Very professional and efficient. The whole experience was positive.",
            "The process was smooth, but I expected more follow-up after the sale.",
            "Good service, but the realtor seemed rushed. Would still recommend.",
            "The realtor was friendly but lacked detailed knowledge about the area.",
            "Overall a good experience. The realtor was reliable and attentive.",
            "The buying process was quick, but there were some minor issues with the closing.",
            "Great experience. The realtor went above and beyond to ensure a smooth transaction."
        ]
        
        reviews = (0..<20).map { _ in
            let randomName = names.randomElement()!
            let randomComment = comments.randomElement()!
            let randomRating = Int.random(in: 1...5)
            let randomLikes = Int.random(in: 0...20)
            let randomDislikes = Int.random(in: 0...10)
            
            return RealtorReviewModel(
                fullName: randomName,
                comment: randomComment,
                ratingCount: randomRating,
                reviewLikeCount: randomLikes,
                reviewDislikeCount: randomDislikes
            )
        }
    }
}


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
                            .font(.subheadline)
                            .fontWeight(.light)
                    }
                
                Text(realtorReviews.fullName)
                    .font(.subheadline)
                
                Spacer()
                
                Text("2 months ago")
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
            }
            
                Text(realtorReviews.comment)
                .font(.subheadline)
                .fontWeight(.light)
                
                HStack {
                    ForEach(0..<realtorReviews.ratingCount, id: \.id) { _ in
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
                .font(.subheadline)
                
                Divider()
                
                
            }
        }
    }
}


struct RealtorPreview: View {
    @StateObject private var viewmodel = RealtorRatingViewmodel()
    
    var body: some View {
        ForEach(viewmodel.reviews, id: \.comment) { review in
            RealtorRating(realtorReviews: review)
        }
    }
}

#Preview {
    RealtorPreview()
}
