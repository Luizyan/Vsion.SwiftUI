import SwiftUI

struct ContentRollView: View {
    @State private var counter: Int = 0
    
    // 1. Defina o preço unitário do item
    let unitPrice: Double = 89.90
    
    // 2. Propriedade computada para o valor total
    var totalPrice: Double {
        return Double(counter) * unitPrice
    }

    var body: some View {
        HStack {
            HStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 80, height: 80)
                    .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    Text("Olha só como esse look tá incrível")
                        .lineLimit(2)
                        .font(.subheadline)
                    
                    // 3. Exibição do Preço Total formatado
                    Text("R$ \(totalPrice, specifier: "%.2f")")
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                .padding(.leading, 8)
            }
            .padding(.horizontal, 8)
            
            Spacer() // Empurra os controles para a direita

            VStack {
                Text("\(counter) PC")
                    .font(.caption)
                
                HStack(spacing: 10) {
                    // Botão de Menos
                    Button(action: {
                        if counter > 0 { counter -= 1 }
                    }){
                        controlIcon(symbol: "-")
                    }

                    // Botão de Mais
                    Button(action: {
                        if counter < 100 { counter += 1 }
                    }){
                        controlIcon(symbol: "+")
                    }
                }
                .padding(.trailing, 8)
            }
        }
        .padding(.vertical, 10)
    }
    
    // Função auxiliar para não repetir código visual dos botões
    @ViewBuilder
    func controlIcon(symbol: String) -> some View {
        Text(symbol)
            .foregroundColor(.black)
            .font(.system(size: 20, weight: .bold))
            .frame(width: 30, height: 30)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(5)
    }
}

#Preview {
    ContentRollView()
}
