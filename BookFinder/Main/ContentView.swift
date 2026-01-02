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
            Book(title: "Harry Potter", authors: "J.K. Rowling", description: "In a magical world Harry, must do some stuff to save the day from bad guys. He is at Hogwarts school of witchcraft and wizardry. He has some friends such as Ron and Hermione. He has an Owl called Hedwig. He also has a pet rat called Scabbers. He is a bit of a wimp but he is very brave.", genre: "Fantasy"),
            Book(title: "LOTD", authors: "William Golding", description: "A battle for freedom featuring the last King of England. There are bad guys such as the Redcoats and the Jacobites. There are good guys such as the Parliamentarians and the Roundheads.", genre: "Drama"),
            Book(title: "1984", authors: "George Orwell", description: "Based on George Orwell's novel set around the year 1984 it includes dystopian themes. with a focus on totalitarianism and surveillance.", genre: "Sci-Fi"),
            Book(title: "Harry Potter", authors: "J.K. Rowling", description: "In a magical world Harry, must do some stuff to save the day from bad guys. He is at Hogwarts school of witchcraft and wizardry. He has some friends such as Ron and Hermione. He has an Owl called Hedwig. He also has a pet rat called Scabbers. He is a bit of a wimp but he is very brave.", genre: "Fantasy"),
            Book(title: "LOTD", authors: "William Golding", description: "Lots of things", genre: "Drama"),
            Book(title: "1984", authors: "George Orwell", description: "Dystopian future", genre: "Sci-Fi"),
            Book(title: "Harry Potter", authors: "J.K. Rowling", description: "Magic things", genre: "Fantasy"),
            Book(title: "LOTD", authors: "William Golding", description: "Lots of things", genre: "Drama"),
            Book(title: "1984", authors: "George Orwell", description: "Dystopian future", genre: "Sci-Fi")
        ]
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(books) { book in
                    Cards(book: book) {
                        remove(book)
                    }
                }
            }
            .padding(25)
            .frame(maxHeight: .infinity)
            
            // controls pressing like dislike or reload on current book
            ActionBarView(
                onDislike: dislike,
                onLike: like,
                onReset: reset
            )
        }
    }
    
    private func remove(_ book: Book) {
        withAnimation {
            books.removeAll { $0.id == book.id }
        }
    }
   
    // swipe left go next book
    private func dislike() {
        // if user swipes left they dont like the book
        // remove from suggestions
        guard let book = books.last else { return }
        print("disliked \(book.title ?? "cant find title")")

        remove(book)
    }
    
    private func like() {
        // if user swiped right they do like the book
        // add to shelf
        guard let book = books.last else { return }
        print("liked \(book.title ?? "cant find title")")

        // add to shelf
        remove(book)
    }
    
    private func reset() {
        
    }
}

#Preview {
    ContentView()
}
