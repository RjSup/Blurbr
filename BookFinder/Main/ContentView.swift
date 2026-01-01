//
//  ContentView.swift
//  BookFinder
//
//  Created by Ryan on 01/01/2026.
//

import SwiftUI

struct ContentView: View {
    // replace with fetching books from data collected (probs view controller)
    @State private var books: [Book] = [
            Book(title: "Harry Potter", authors: "J.K. Rowling", description: "Magic things", genre: "Fantasy"),
            Book(title: "LOTD", authors: "William Golding", description: "Lots of things", genre: "Drama"),
            Book(title: "1984", authors: "George Orwell", description: "Dystopian future", genre: "Sci-Fi"),
            Book(title: "Harry Potter", authors: "J.K. Rowling", description: "Magic things", genre: "Fantasy"),
            Book(title: "LOTD", authors: "William Golding", description: "Lots of things", genre: "Drama"),
            Book(title: "1984", authors: "George Orwell", description: "Dystopian future", genre: "Sci-Fi"),
            Book(title: "Harry Potter", authors: "J.K. Rowling", description: "Magic things", genre: "Fantasy"),
            Book(title: "LOTD", authors: "William Golding", description: "Lots of things", genre: "Drama"),
            Book(title: "1984", authors: "George Orwell", description: "Dystopian future", genre: "Sci-Fi")
        ]
    
    var body: some View {
        ZStack {
            ForEach(books) { book in
                Cards(book: book) {
                    remove(book)
                }
            }
            .padding()
        }
        .padding()
    }
    
    private func remove(_ book: Book) {
        withAnimation {
            books.removeAll { $0.id == book.id }
        }
    }
    
    // swipe right save book to bookcase
    
    // swipe left go next book
}

#Preview {
    ContentView()
}
