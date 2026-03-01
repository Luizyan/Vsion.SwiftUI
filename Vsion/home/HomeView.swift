//
//  HomeView.swift
//  Vsion
//
//  Created by Luiz Yan on 11/02/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            TopHome()
                .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
