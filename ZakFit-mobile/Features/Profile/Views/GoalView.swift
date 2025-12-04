//
//  GoalView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import SwiftUI

struct GoalView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Mes Objectifs")
                    .font(.custom("Lexend-Medium", size: 24))
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    NavigationStack {
        GoalView()
    }
}
