//
//  FocusFlowApp.swift
//  FocusFlow
//
//  Created by Luiz Yan on 11/02/26.

import SwiftUI
import Firebase

@main
struct Vsion: App {
    
    // O 'init' roda assim que o app inicia
    init() {
        FirebaseApp.configure()
        print("firebase configurado")
    }

    var body: some Scene {
        WindowGroup {
            SignView()
        }
    }
}
