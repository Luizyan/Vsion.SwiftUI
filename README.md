# Vsion
Aplicativo iOS desenvolvido em SwiftUI, focado em apresentar uma tela inicial (Home) com navegação e um resumo de compras com valores. O projeto segue boas práticas de organização, uso de `NavigationStack` e componentes reutilizáveis.

## Sumário
- [Visão Geral](#visão-geral)
- [Funcionalidades](#funcionalidades)
- [Arquitetura](#arquitetura)
- [Requisitos](#requisitos)
- [Como Executar](#como-executar)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Padrões e Boas Práticas](#padrões-e-boas-práticas)
- [Testes](#testes)
- [Roadmap](#roadmap)
- [Contribuição](#contribuição)


## Visão Geral
O Vsion é um projeto SwiftUI simples e extensível. A tela Home utiliza `NavigationStack` e apresenta a view `TopHome`. Há também um componente `TotalValue` responsável por exibir uma lista de compras com preço, quantidade e total formatado de acordo com a `Locale` do dispositivo.

## Funcionalidades
- Navegação com `NavigationStack`.
- Componente de resumo de compras:
  - Lista itens com nome, preço e quantidade.
  - Calcula subtotais por item e total geral.
  - Formatação em moeda conforme a região do usuário.
  - Estado de vazio com `ContentUnavailableView` quando não há itens.

## Arquitetura
- SwiftUI como framework principal de UI.
- Componentização de views para reuso e manutenção.
- Cálculos de total encapsulados na própria view que exibe os dados.

### Autenticação (MVVM)
Aplicamos o padrão de arquitetura **MVVM** na camada de autenticação, separando claramente responsabilidades:
- **Model**: estruturas/entidades que representam o usuário e credenciais, além de serviços responsáveis por comunicação e validação.
- **View**: telas SwiftUI responsáveis por renderizar o estado e encaminhar interações do usuário.
- **ViewModel**: orquestra a lógica de autenticação, expõe estado observável para a View (ex.: progresso, erros, sessão) e chama serviços do Model.

Essa separação facilita testes, manutenção e evolução da autenticação sem acoplamento indevido à interface.

## Requisitos
- Xcode 15 ou superior (recomendado Xcode 26.2).
- iOS 17 ou superior.
- Swift 5.9 ou superior (o projeto é compatível com versões mais novas do Swift, conforme o Xcode).

## Como Executar
1. Abra o projeto no Xcode.
2. Selecione um simulador ou dispositivo.
3. Compile e rode com Command + R.

### Pré-visualizações (Previews)
- Use os `#Preview` das views para visualizar rapidamente componentes como `HomeView` e `TotalValue`.

## Estrutura do Projeto
- `HomeView.swift`: Tela inicial com `NavigationStack` e `TopHome` como conteúdo principal.
- `TotalValue.swift`: Componente de resumo de compras, exibindo lista de itens e total.
- `TopHome.swift`: View principal do conteúdo da Home (não detalhada aqui; consulte o arquivo correspondente no projeto).

> Observação: A estrutura pode evoluir conforme novas features forem adicionadas (ex.: camadas de modelos, serviços, etc.).

## Padrões e Boas Práticas
- Uso de `NavigationStack` e `.navigationTitle` para consistência na navegação.
- Separação de responsabilidades por view/componente.
- Formatação de valores monetários utilizando `Locale.current.currency?.identifier` com fallback para `USD`.
- Acessibilidade básica em listas (uso de `accessibilityElement` e rótulos descritivos quando aplicável).
- Aplicação do padrão **MVVM** na camada de autenticação para separar responsabilidades (Model, View e ViewModel) e facilitar testes/manutenção.

## Testes
- O projeto ainda não contém testes automatizados. Sugestões:
  - Adicionar testes de UI com XCUITest para fluxos principais.
  - Adicionar testes unitários para validação de cálculos de totais.
  - Se optar por Swift Testing (novo framework), criar suítes com `@Suite` e `@Test` para validar regras de negócio.

## Roadmap
- Integrar estado compartilhado entre Home e TotalValue para refletir alterações em tempo real.
- Adicionar persistência leve (ex.: `@AppStorage` ou SwiftData) para salvar carrinho.
- Adicionar testes automatizados.

## Contribuição
Contribuições são bem-vindas! Para propor mudanças:
1. Abra uma issue descrevendo a motivação.
2. Crie um branch a partir da `main`.
3. Envie um pull request com as alterações e descrição clara do impacto.



