//
//  SignView.swift
//  Vsion
//
//  Created by Luiz Yan on 04/03/26.
//

import SwiftUI

struct SignView: View {
    // 1. Instanciamos a ViewModel
    @StateObject private var viewModel = SignViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Bem-vindo")
                .font(.largeTitle)
                .bold()
            
            // Campos de entrada conectados ao Model
            VStack(alignment: .leading, spacing: 12) {
                TextField("E-mail", text: $viewModel.signModel.email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Senha", text: $viewModel.signModel.password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)
            
            // Exibição de erro (se houver)
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }
            
            // Botão de Ação
            Button(action: {
                // Chamada assíncrona dentro de uma Task
                Task {
                    await viewModel.logIn()
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .foregroundColor(viewModel.isLoading ? .gray : .blue)
                    
                    if viewModel.isLoading {
                        ProgressView() // O "spinner" de carregamento
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Text("Entrar")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
            .padding(.horizontal)
            .disabled(viewModel.isLoading) // Bloqueia o botão enquanto carrega
        }
        // Exemplo de navegação após login
        .fullScreenCover(isPresented: $viewModel.loggedUser) {
            HomeView()
        }
    }
}
