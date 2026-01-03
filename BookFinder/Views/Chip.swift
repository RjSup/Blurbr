//
//  Chip.swift
//  BookFinder
//
//  Created by Ryan on 03/01/2026.
//

import SwiftUI

struct Chip: View {
    let text: String
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Text(text)
            .frame(minWidth: 100)
            .font(.subheadline)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
            .foregroundColor(isSelected ? .white : .primary)
            .clipShape(Capsule())
            .onTapGesture(perform: onTap)
    }
}
