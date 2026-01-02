//
//  Onboarding.swift
//  BookFinder
//
//  Created by Ryan on 01/01/2026.
//
// only show to new users
// 1. what genre they like, 2. short or long book? 3. Author, 4. Mood
// all questions at once or one-by-one?

import SwiftUI

struct Onboarding: View {
    @Binding var isComplete: Bool
    
    var body: some View {
        TabView {
            // welcome
            OnboardingViewSteps(title: "Welcome to Blurbr", description: "Discover what to read next.")
            // take genre data here
            OnboardingViewSteps(title: "Choose Genre", description: "Now choose your genre")
            // take length here
            OnboardingViewSteps(title: "Choose book length", description: "Now choose if you wanna read a short book or a long one")
            // take mood here
            OnboardingViewSteps(title: "Choose your mood", description: "What king of mood are you feeling today?")
            // this stage should store options and fetch books for cardview related to users options
            OnboardingViewSteps(title: "All done", description: "You are now ready to discover books to read")
            .overlay(
                Button("Get started") {
                    isComplete = true
                }
                .padding(),
                alignment: .bottom
            )
        }
        // styling tab per index
        .tabViewStyle(.page(indexDisplayMode: .always))
        // making each index a dot
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        
    }
}

struct OnboardingViewSteps: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
            Text(description)
        }
    }
}

#Preview {
    Onboarding(isComplete: .constant(false))
}
