//
//  ProfileHealthView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import SwiftUI

struct ProfileHealthView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Ma Santé")
                    .font(.custom("Lexend-Medium", size: 24))
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileHealthView()
    }
}
