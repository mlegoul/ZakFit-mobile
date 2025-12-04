//
//  MyActivitiesView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import SwiftUI

struct MyActivitiesView: View {
    @State private var viewModel: MyActivitiesViewModel
    
    init() {
        _viewModel = State(wrappedValue: MyActivitiesViewModel(appState: AppState()))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error {
                Text("Erreur : \(error.localizedDescription)")
            } else {
                List(viewModel.activities) { activity in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(activity.type)
                            .font(.custom("Lexend-Medium", size: 18))
                        HStack {
                            Text("\(activity.calories) kcal")
                            Spacer()
                            Text("\(activity.duration) min")
                        }
                        .font(.custom("Lexend-Light", size: 14))
                        .foregroundColor(.gray)
                        Text(activity.date, style: .date)
                            .font(.custom("Lexend-Light", size: 12))
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                .listStyle(PlainListStyle())
            }
        }
        .task {
            await viewModel.fetchActivities()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Mes activités")
                    .font(.custom("Lexend-Medium", size: 24))
                    .fontWeight(.bold)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 22, weight: .bold))
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MyActivitiesView()
    }
}
