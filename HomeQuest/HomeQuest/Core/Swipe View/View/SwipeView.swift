//
//  SwipeView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 18/07/2024.
//

import SwiftUI
import SwiftfulUI

struct SwipeView: View {
    @StateObject private var viewmodel = SwipeViewmodel()
    @State private var selectedFilter: HeaderFilterButtons = .rent
    
    @State private var selectedIndex: Int = 0
    @State private var cardOffsets: [Int: Bool] = [:] // UserId : Direction is Right == TRUE
    @State private var currentSwipeOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
//            Color.gray.opacity(0.3)
//                .ignoresSafeArea()
            
            VStack {
                header
                HeaderFilter(selectedFilter: $selectedFilter)
                    .background(Divider(), alignment: .bottom)
                
                ZStack {
                    if !viewmodel.properties.isEmpty {
                        ForEach(Array(viewmodel.properties.enumerated()), id: \.offset) { (index, property) in
                            
                            let isPrevious = (selectedIndex - 1) == index
                            let isCurrent = selectedIndex == index
                            let isNext = (selectedIndex + 1) == index

                            if isPrevious || isCurrent || isNext {
                                let offsetValue = cardOffsets[property.id]
                                propertyProfileCell(property: property, index: index)
                                    .zIndex(Double(viewmodel.properties.count - index))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                            }
                        }
                    } else {
                        ProgressView()
                    }
                    
                    overlaySwipingIndicators
                        .zIndex(999999)
                }
                .frame(maxHeight: .infinity)
                .padding(4)
                .animation(.smooth, value: cardOffsets)
            }
            .padding(4)
        }
    }
    
    private func propertyDidSelect(index: Int, isLike: Bool) {
        let property = viewmodel.properties[index]
        cardOffsets[property.id] = isLike
        selectedIndex += 1
    }
    
    private var header: some View {
        HStack {
            Image(systemName: "arrow.uturn.left")
                .padding(8)
                .background(.blue.opacity(0.001))
                .onTapGesture {
                    // Bring back the property
                }
            
            Text("HouseQuest")
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .font(.title2)
        .padding(.horizontal)
        .padding(.top, 8)
    }
    
    private func propertyProfileCell(property: PropertyModel, index: Int) -> some View {
        PropertyCardView(
            property: property,
            onXmarkButtonPressed: {
                propertyDidSelect(index: index, isLike: false)
            },
            onCheckmarkButtonPressed: {
                propertyDidSelect(index: index, isLike: true)
            }
        )
        .withDragGesture(
            .horizontal,
            minimumDistance: 10,
            resets: true,
            rotationMultiplier: 1.05,
            scaleMultiplier: 0.4,
            onChanged: { dragOffset in
                currentSwipeOffset = dragOffset.width
            },
            onEnded: { dragOffset in
                if dragOffset.width < -50 {
                    propertyDidSelect(index: index, isLike: false)
                } else if dragOffset.width > 50 {
                    propertyDidSelect(index: index, isLike: true)
                }
            }
        )
    }
    
    private var overlaySwipingIndicators: some View {
        ZStack {
            Circle()
                .fill(.gray.opacity(0.4))
                .overlay(
                    Image(systemName: "xmark")
                        .font(.title)
                        .fontWeight(.semibold)
                )
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1.0)
                .offset(x: min(-currentSwipeOffset, 150))
                .offset(x: -100)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Circle()
                .fill(.gray.opacity(0.4))
                .overlay(
                    Image(systemName: "checkmark")
                        .font(.title)
                        .fontWeight(.semibold)
                )
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1.0)
                .offset(x: max(-currentSwipeOffset, -150))
                .offset(x: 100)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .animation(.smooth, value: currentSwipeOffset)
    }
}

#Preview {
    SwipeView()
}

