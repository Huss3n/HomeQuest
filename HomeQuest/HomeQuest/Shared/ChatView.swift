//
//  ChatView.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 22/07/2024.
//

import SwiftUI

enum MessageOwner {
    case sender
    case receiver
}

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let owner: MessageOwner
}

struct ChatView: View {
    @Environment(\.dismiss) var dismiss
    @FocusState private var messageFieldIsFocused: Bool
    @State private var messages: [Message] = []
    @State private var messageText: String = ""
    let realtorPhoneNumber = "0729 683 600"
    
    @State private var showPhoneAlert: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        if messages.isEmpty {
                            VStack {
                                Image(systemName: "bubble.left.and.bubble.right.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.gray)
                                Text("No messages yet")
                                    .font(.headline)
                                    .padding(.top)
                                Text("Start the conversation by sending a message.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.top, 2)
                            }
                            .padding(.top, 120)
                            
                        } else {
                            ForEach(messages) { message in
                                messageView(message: message)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                
                Spacer()
                
                HStack {
                    TextField("Enter message", text: $messageText, axis: .vertical)
                        .onSubmit {
                            sendMessage()
                            messageFieldIsFocused = false
                        }
                        .focused($messageFieldIsFocused)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.primary.opacity(0.3), lineWidth: 1.0)
                        }
                    
                    Button(action: sendMessage) {
                        Image(systemName: "arrow.up")
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    .padding(.trailing)
                }
            }
            .onAppear {
                messageFieldIsFocused = true
            }
            .padding(.horizontal, 10)
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "xmark.circle")
                        .onTapGesture {
                            dismiss()
                        }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "phone.fill")
                        .foregroundStyle(.blue)
                        .onTapGesture {
                            if let url = URL(string: "tel://\(realtorPhoneNumber)"), UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            }
                        }
                }
            }
        }
    }
    
    private func sendMessage() {
        let newMessage = Message(text: messageText, owner: .sender)
        messages.append(newMessage)
        messageText = ""
        messageFieldIsFocused = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let replyMessage = Message(text: "Thank you for your message. I have received it and will get back to you as soon as possible.", owner: .receiver)
            withAnimation(.smooth) {
                messages.append(replyMessage)
            }
        }
    }
    
    private func messageView(message: Message) -> some View {
        HStack {
            if message.owner == .sender {
                Spacer()
                Text(message.text)
                    .font(.subheadline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(14)
                //                    .frame(maxWidth: 250, alignment: .trailing)
            } else {
                Text(message.text)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                //                    .frame(maxWidth: 250, alignment: .leading)
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    ChatView()
}

