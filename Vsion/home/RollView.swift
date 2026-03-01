//
//  RollView.swift
//  Vsion
//
//  Created by Luiz Yan on 11/02/26.
//

import SwiftUI

struct RollView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(0..<5) {contentRollView in ContentRollView()
                    }
                }
            }
        }
    }
}

#Preview {
    RollView()
}
