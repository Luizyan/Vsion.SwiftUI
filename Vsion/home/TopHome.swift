//
//  TopHome.swift
//  Vsion
//
//  Created by Luiz Yan on 12/02/26.
//

import SwiftUI

struct TopHome: View {
    var body: some View {
        NavigationStack {
            RollView()
                .navigationTitle("Roupas e Acessórios")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    
                    // Item da Direita (Navegação para outra tela)
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            // 1. Destino: A tela que vai abrir
                            PurchaseValue()
                        } label: {
                            // 2. O que o usuário vê na barra
                            Text("$")
                        }
                    }
                }
        }
    }
}

// Uma tela de exemplo para onde vamos navegar

#Preview {
    TopHome()
}
