import SwiftUI
import FirebaseAuth
import Combine

@MainActor
class SignViewModel: ObservableObject {
    
    // MARK: - Model
    @Published var signModel = SignModel()
    
    // MARK: - Estados da tela
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    @Published var loggedUser: Bool = false
    
    // 2. Transformamos a função em 'async'
    func logIn() async {
        // Validação local
        guard signModel.loginValid() else {
            errorMessage = "Email ou senha inválidos"
            return
        }
        
        isLoading = true
        errorMessage = "" // Limpa erros de tentativas anteriores
        
        // 3. Bloco do-catch para lidar com a resposta do Firebase
        do {
            // O 'try await' faz a pausa inteligente: o app não trava,
            // mas o código só continua após a resposta do servidor.
            try await Auth.auth().signIn(withEmail: signModel.email,
                                        password: signModel.password)
            
            // Se chegou aqui, deu certo!
            loggedUser = true
            
        } catch {
            // Se o Firebase retornar erro (senha errada, sem internet, etc)
            errorMessage = error.localizedDescription
        }
        
        // Finaliza o estado de carregamento
        isLoading = false
    }
}
