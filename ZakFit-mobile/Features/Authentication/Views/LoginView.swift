//
//  LoginView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import SwiftUI

struct LoginView: View {
    @State var viewModel: LoginViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 150)
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                
                VStack(spacing: 8) {
                    Text("Bon retour !")
                        .font(.custom("Lexend-Medium", size: 27))
                    Text("Connectez-vous")
                        .font(.custom("Lexend-Medium", size: 27))
                }
                .foregroundColor(.primary)
                .padding(.bottom, 50)
                
                VStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("light-grey"))
                            .frame(height: 56)
                        
                        TextField("Email", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .font(.custom("Lexend-Medium", size: 16))
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .padding(.horizontal, 16)
                    }
                    .frame(width: 360, height: 56)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("light-grey"))
                            .frame(height: 56)
                        
                        SecureField("Mot de passe", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .font(.custom("Lexend-Medium", size: 16))
                            .padding(.horizontal, 16)
                    }
                    .frame(width: 360, height: 56)
                    
                    Button(action: {
                        Task {
                            await viewModel.login()
                        }
                    }) {
                        Text("Se connecter")
                            .font(.custom("Lexend-Medium", size: 18))
                            .foregroundColor(.white)
                            .frame(width: 360, height: 56)
                            .background(Color.black)
                            .cornerRadius(25)
                    }
                    .padding(.top, 50)

                }
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text("Vous n’avez pas de compte ?")
                        .font(.custom("Lexend-Bold", size: 17))
                        .foregroundColor(.primary)
                    
                    NavigationLink(destination: RegisterView()) {
                        Text("Créer un compte")
                            .font(.custom("Lexend-Bold", size: 17))
                            .foregroundColor(Color("light-orange"))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
