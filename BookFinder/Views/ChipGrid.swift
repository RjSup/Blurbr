//
//  ChipGrid.swift
//  BookFinder
//
//  Created by Ryan on 03/01/2026.
//

import SwiftUI

struct ChipGrid: View {
    let items: [String]
    let selected: [String]
    let onToggle: (String) -> Void

    private let columns = [
        GridItem(.adaptive(minimum: 80), spacing: 24)
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(items, id: \.self) { item in
                Chip(
                    text: item,
                    isSelected: selected.contains(item)
                ) {
                    onToggle(item)
                }
            }
        }
    }
}

