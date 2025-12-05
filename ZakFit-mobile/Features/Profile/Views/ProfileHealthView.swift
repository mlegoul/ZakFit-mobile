//
//  ProfileHealthView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import SwiftUI

struct ProfileHealthView: View {
    @State var viewModel: ProfileHealthViewModel
    
    init() {
        _viewModel = State(wrappedValue: ProfileHealthViewModel(appState: AppState()))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TextField("Taille (en cm)", text: $viewModel.lastName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding()
            
            TextField("Poids (en kg)", text: $viewModel.firstName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding()
            
            TextField("Préférences alimentaire", text: $viewModel.email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
            
            TextField("Niveau d'activité", text: $viewModel.password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding()
            
            TextField("Âge", text: $viewModel.password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding()
            
            TextField("Homme ou Femme", text: $viewModel.password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding()
            Spacer()
            
            
            Button {
            } label: {
                Text("Enregistrer")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.lightOrange)
                    .cornerRadius(25)
            }
            .padding()
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
