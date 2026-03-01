//
//  LoginView.swift
//  Vsion
//
//  Created by Luiz Yan on 14/02/26.
//

import SwiftUI
import FirebaseAuth // 1. Importante importar a autenticação

struct LoginView: View {
    @State private var userName: String = "" // No Firebase, usaremos isso como E-mail
    @State private var password: String = ""
    @State private var statusMessage: String = "" // Para exibir erros na tela
    @State private var isLoggedIn: Bool = false // Para navegar após o login
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("bem vindo a Vsion")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(50)
                    .foregroundStyle(Color(.systemBlue))
                
                Text("User Login")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                TextField("E-mail", text: $userName) // Lembre-se: use formato de e-mail
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .autocapitalization(.none) // Evita que o iPhone coloque letra maiúscula no e-mail
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Exibe mensagens de erro se houver
                if !statusMessage.isEmpty {
                    Text(statusMessage)
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                
                VStack(spacing: 15) {
                    // BOTÃO DE LOGIN
                    Button(action: login) {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .fontWeight(.bold)
                    }
                    
                    // BOTÃO DE CADASTRO
                    Button(action: cadastrar) {
                        Text("Criar Conta")
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                // Navegação automática quando logar
                .navigationDestination(isPresented: $isLoggedIn) {
                    HomeView()
                }
            }
        }
    }
    
    // MARK: - Funções de Autenticação
    
    func login() {
        Auth.auth().signIn(withEmail: userName, password: password) { result, error in
            if let error = error {
                self.statusMessage = error.localizedDescription
            } else {
                self.isLoggedIn = true
            }
        }
    }
    
    func cadastrar() {
        Auth.auth().createUser(withEmail: userName, password: password) { result, error in
            if let error = error {
                self.statusMessage = error.localizedDescription
            } else {
                self.statusMessage = "Conta criada! Agora clique em Login."
            }
        }
    }
}

#Preview {
    LoginView()
}
