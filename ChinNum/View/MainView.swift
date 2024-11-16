//
//  MainView.swift
//  ChinNum
//
//  Created by joe on 11/11/24.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gVM
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("Joy", action: {
                gVM.randomExpressionOfJoy()
            })
            .padding()
            
            Button("Incorrect Answers", action: {
                gVM.incorrectSound()
            })
            .padding()
            
            Button("7", action: {
                gVM.playNumber(num: 7)
            })
            .padding()
            Button("30", action: {
                gVM.playNumber(num: 30)
            })
            .padding()
            Button("74", action: {
                gVM.playNumber(num: 74)
            })
            .padding()
        }
        .padding()
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
