//
//  OnboardingData.swift
//  BookFinder
//
//  Created by Ryan on 01/01/2026.
//
// store onboarding information
// use later to query books from api

import SwiftUI

struct OnboardingData {
    var genres: [String] = []
    var mood: [String] = []
    var authors: [String] = []
    var bookLength: BookLength? = nil
}

enum BookLength: String, CaseIterable {
    case short = "Short"
    case long = "Long"
}
