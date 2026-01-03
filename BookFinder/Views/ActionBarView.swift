//
//  ActionBarView.swift
//  BookFinder
//
//  Created by Ryan on 02/01/2026.
//

import SwiftUI

struct ActionBarView: View {
    let onDislike: () -> Void
    let onLike: () -> Void
    let onReset: () -> Void
    
    var body: some View {
        HStack(spacing: 60) {
            Button(action: onDislike) {
                Image(systemName: "xmark")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.red)
            }
            
            Button(action: onReset) {
                Image(systemName: "arrow.counterclockwise")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.blue)
            }
            
            Button(action: onLike) {
                Image(systemName: "heart.fill")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.green)
            }
        }
        .frame(width: 400)
        .padding()
        .background(.ultraThinMaterial)
    }
}

