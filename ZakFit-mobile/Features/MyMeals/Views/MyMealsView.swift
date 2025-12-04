//
//  MyMealsView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import SwiftUI

struct MyMealsView: View {
    @State private var viewModel: MyMealsViewModel
    
    init() {
        _viewModel = State(wrappedValue: MyMealsViewModel(appState: AppState()))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error {
                Text("Erreur : \(error.localizedDescription)")
            } else {
                List(viewModel.meals) { meal in
                    MealCardView(meal: meal)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .listRowInsets(
                            EdgeInsets(
                                top: 4,
                                leading: 0,
                                bottom: 4,
                                trailing: 0
                            )
                        )
                }
                .listStyle(PlainListStyle())
            }
        }
        .task {
            await viewModel.fetchMeals()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Mes repas")
                    .font(.custom("Lexend-Medium", size: 24))
                    .fontWeight(.bold)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MyMealsView()
    }
}
