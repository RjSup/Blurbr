//
//  BookFinderApp.swift
//  BookFinder
//
//  Created by Ryan on 01/01/2026.
//

import SwiftUI

@main
struct BookFinderApp: App {
    @AppStorage("onboardingCompleted") private var onboardingCompleted: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if onboardingCompleted {
                ContentView()
            } else {
                Onboarding(isComplete: $onboardingCompleted)
            }
        }
    }
}
