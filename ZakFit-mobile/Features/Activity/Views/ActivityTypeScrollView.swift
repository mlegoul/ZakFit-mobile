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
            HStack {
                ForEach(ActivityType.allCases) { activity in
                    Text(activity.displayName)
                        .padding()
                        .background(
                            selectedActivity == activity ? Color.blue : Color.gray
                                .opacity(0.2)
                        )
                        .foregroundColor(.black)
                        .cornerRadius(25)
                        .onTapGesture {
                            selectedActivity = activity
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedActivity: ActivityType = .running
    return ActivityTypeScrollView(selectedActivity: $selectedActivity)
        .padding()
}

