//
//  HeaderFilter.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 18/07/2024.
//

import SwiftUI

enum HeaderFilterButtons: String, Hashable, CaseIterable {
    case rent
    case sale
   
    var displayName: String {
        switch self {
        case .sale:
            return "For Sale"
        case .rent:
            return "For Rent"
        }
    }
}

struct HeaderFilter: View {
    @Binding var selectedFilter: HeaderFilterButtons
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            ForEach(HeaderFilterButtons.allCases, id: \.rawValue) { filter in
                VStack {
                    Text(filter.displayName)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if selectedFilter == filter {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                }
                .padding(.top, 8)
                .background(.black.opacity(0.001))
                .foregroundStyle(selectedFilter == filter ? Color.blue : Color.primary)
                .onTapGesture {
                    selectedFilter = filter
                }
            }
        }
        .animation(.smooth, value: selectedFilter)
    }
}

#Preview {
    HeaderFilter(selectedFilter: .constant(.rent))
}
