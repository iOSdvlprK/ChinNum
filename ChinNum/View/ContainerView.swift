//
//  ContainerView.swift
//  ChinNum
//
//  Created by joe on 11/23/24.
//

import SwiftUI

struct ContainerView: View {
    @State private var splashScreenIsPresented = true
    
    
    var body: some View {
        if splashScreenIsPresented {
            SplashScreenView(isPresented: $splashScreenIsPresented)
                .disabled(!splashScreenIsPresented)
        } else {
            MainView()
        }
    }
}

#Preview {
    ContainerView()
        .environment(GameViewModel())
}
