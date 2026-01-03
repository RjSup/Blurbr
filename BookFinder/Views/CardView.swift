//
//  Cards.swift
//  BookFinder
//
//  Created by Ryan on 01/01/2026.
//

import SwiftUI

struct Cards: View {
    let book: Book
    let onRemove: () -> Void
    let onLike: () -> Void
    let onDislike: () -> Void
    
    @State private var offset: CGSize = .zero
    @State private var isFlipped: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if isFlipped {
                Text(book.title ?? "Not found")
                    .font(.title)
                    .bold()
                
                Text(book.author ?? "Not found")
                    .font(.subheadline)
                    .bold()
                
                Text(book.genre ?? "Not found")
                    .font(.caption)
            } else {
                Text(book.description ?? "Not found")
                    .font(.body)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 5)
        )
        .offset(x: offset.width, y: offset.height)
        .rotationEffect(.degrees(Double(offset.width / 20)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    handleSwipe()
                }
            )
            .animation(.spring(), value: offset)
            .onTapGesture {
                isFlipped.toggle()
            }
    }
    
    private func handleSwipe() {
        let threshold: CGFloat = 120
        
        if offset.width > threshold {
            onLike()
        }
        else if offset.width < -threshold {
            onDislike()
        } else {
            offset = .zero
        }
    }
}

#Preview {
    let sample = Book(title: "Sample Title", authors: "Sample Author", description: "This is a sample description used for previewing the card view.", genre: "Fiction")
    return Cards(
        book: sample,
        onRemove: {},
        onLike: {},
        onDislike: {}
    )
}
