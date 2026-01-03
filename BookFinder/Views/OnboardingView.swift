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
    @State private var data = OnboardingData()
    
    var body: some View {
        TabView {
            WelcomeStep()
            GenreStep(genres: $data.genres)
            LengthStep(bookLength: $data.bookLength)
            MoodStep(moods: $data.mood)
            FinishStep {
                isComplete = true
                print(data)
            }
        }
        // styling tab per index
        .tabViewStyle(.page(indexDisplayMode: .always))
        // making each index a dot
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

// welcome screen
struct WelcomeStep: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to Blurbr")
                .font(.largeTitle)
                .bold()

            Text("Discover what to read next.")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

// genre chossing screen
struct GenreStep: View {
    @Binding var genres: [String]
    @State private var customGenre = ""
    private let commonGenres = [
        "Fantasy", "Sci-Fi", "Romance", "Mystery",
        "Thriller", "Drama", "Non-fiction"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("What genres do you like?")
                .font(.largeTitle)
                .bold()

            TextField("Add a genre…", text: $customGenre)
                .textFieldStyle(.roundedBorder)
                .onSubmit(addCustomGenre)

            ChipGrid(
                items: commonGenres,
                selected: genres,
                onToggle: toggleGenre
            )
        }
        .padding()
    }

    private func toggleGenre(_ genre: String) {
        if genres.contains(genre) {
            genres.removeAll { $0 == genre }
        } else {
            genres.append(genre)
        }
    }

    private func addCustomGenre() {
        let trimmed = customGenre.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }

        if !genres.contains(trimmed) {
            genres.append(trimmed)
        }

        customGenre = ""
    }
}

// length of book choosing screen
struct LengthStep: View {
    @Binding var bookLength: BookLength?

    var body: some View {
        VStack(spacing: 20) {
            Text("How long do you like your books?")
                .font(.largeTitle)
                .bold()

            Picker("Book Length", selection: $bookLength) {
                ForEach(BookLength.allCases, id: \.self) { length in
                    Text(length.rawValue).tag(length as BookLength?)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}

// mood choosing screen
struct MoodStep: View {
    @Binding var moods: [String]
    @State private var customMood = ""
    private let commonMoods = [
        "Chill", "Happy", "Dark",
        "Adventurous", "Cozy", "Emotional"
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("What’s your mood?")
                .font(.largeTitle)
                .bold()

            TextField("Describe your mood…", text: $customMood)
                .textFieldStyle(.roundedBorder)
                .onSubmit(addCustomMood)

            ChipGrid(
                items: commonMoods,
                selected: moods,
                onToggle: toggleMood
            )
        }
        .padding()
    }

    private func toggleMood(_ mood: String) {
        if moods.contains(mood) {
            moods.removeAll { $0 == mood }
        } else {
            moods.append(mood)
        }
    }

    private func addCustomMood() {
        let trimmed = customMood.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }

        if !moods.contains(trimmed) {
            moods.append(trimmed)
        }

        customMood = ""
    }
}

// final step
struct FinishStep: View {
    let onFinish: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("All Done")
                .font(.largeTitle)
                .bold()

            Text("You’re ready to discover books.")

            Button("Get Started") {
                onFinish()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    Onboarding(isComplete: .constant(false))
}
