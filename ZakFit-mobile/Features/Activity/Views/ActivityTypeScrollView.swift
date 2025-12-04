//
//  ActivityTypeScrollView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import SwiftUI

struct ActivityTypeScrollView: View {
    @Binding var selectedActivity: ActivityType
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(ActivityType.allCases, id: \.self) { activity in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            selectedActivity = activity
                        }
                    } label: {
                        Text(activity.displayName)
                            .font(.custom("Lexend-Medium", size: 14))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 9)
                            .padding(.horizontal, 9)
                            .background(
                                selectedActivity == activity ? Color.blue : Color.gray.opacity(0.2)
                            )
                            .foregroundColor(
                                selectedActivity == activity ? .white : .primary
                            )
                            .cornerRadius(20)
                    }
                }
            }
        }
        .padding(.top, 8)
    }
}

#Preview {
    @Previewable @State var selectedActivity: ActivityType = .running
    return ActivityTypeScrollView(selectedActivity: $selectedActivity)
        .padding()
}
