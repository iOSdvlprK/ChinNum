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
    
    @State private var done: Bool = false
    
    var gameOver: Bool {
        gVM.gameModel.gameWon
    }
    
    var body: some View {
        ZStack {
            GearIconView(showSettingsView: $showSettingsView)

            VStack {
                ScoreView(score: gVM.gameModel.score, maxTurns: gVM.gameModel.maxTurns)
                
                Toggle(showPinyin ? "Hide Pinyin" : "Show Pinyin", isOn: $showPinyin.animation())
                    .padding(.vertical)
                
                if let chineseNum = Chinese.num99ToChinese(num: gVM.gameModel.answer) {
                    Spacer()
                    
                    Text(chineseNum.chinese)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text(chineseNum.pinyin)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .opacity(showPinyin ? 1 : 0)
                }
                
                NumberOptionsView(numbers: gVM.gameModel.alternatives, answer: gVM.gameModel.answer)
                    .onChange(of: gVM.gameModel.turns) { oldValue, newValue in
                        gVM.gameModel.generateNewProblem()
                    }
            }
            .padding()
        }
        .fullScreenCover(isPresented: $done) {
            GameOverView(color: .green.opacity(0.8))
        }
        .fullScreenCover(isPresented: $showSettingsView, content: {
            SettingsView(showSettingsView: $showSettingsView, volume: gVM.gameModel.volume)
        })
        .onChange(of: gameOver) { oldValue, newValue in
            done = gameOver
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
