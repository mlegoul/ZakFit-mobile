//
//  ProfileDataView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import SwiftUI

struct ProfileDataView: View {
    @State var viewModel: ProfileDataViewModel
    
    init() {
        _viewModel = State(wrappedValue: ProfileDataViewModel(appState: AppState()))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            TextField("Nom", text: $viewModel.lastName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding()
                
            TextField("Prénom", text: $viewModel.firstName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding()
                
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                
            SecureField("Mot de passe", text: $viewModel.password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding()
            Spacer()
            
            Button {
                Task {
                    await viewModel.updateProfile()
                }
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
                Text("Mes informations")
                    .font(.custom("Lexend-Medium", size: 24))
                    .fontWeight(.bold)
            }
        }
    }
}
