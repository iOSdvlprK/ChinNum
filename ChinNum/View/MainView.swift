//
//  MainView.swift
//  ChinNum
//
//  Created by joe on 11/11/24.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gVM
    
    @State private var showSettingsView: Bool = false
    @State private var showPinyin: Bool = true
    
    var body: some View {
        ZStack {
            GearIconView(showSettingsView: $showSettingsView)

            VStack {
                ScoreView(score: gVM.gameModel.score, maxTurns: gVM.gameModel.maxTurns)
                
                Toggle(showPinyin ? "Hide Pinyin" : "Show Pinyin", isOn: $showPinyin.animation())
                    .padding(.vertical)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
