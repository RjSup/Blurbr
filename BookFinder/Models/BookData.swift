//
//  Book.swift
//  BookFinder
//
//  Created by Ryan on 01/01/2026.
//
// book API info

import SwiftUI

class Book: Identifiable {
    let id = UUID()
    let title: String?
    let author: String?
    let description: String?
    let genre: String?
    
    init(title: String?, authors: String?, description: String?, genre: String?) {
        self.title = title
        self.author = authors
        self.description = description
        self.genre = genre
    }
}
