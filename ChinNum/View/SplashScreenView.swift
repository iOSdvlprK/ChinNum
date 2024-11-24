//
//  SplashScreenView.swift
//  ChinNum
//
//  Created by joe on 11/23/24.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isPresented: Bool
    
    @State private var opacity = 0.0
    @State private var scale = CGSize(width: 0.5, height: 0.5)
    @State private var moveUp = false
    @State private var angle = 45.0
    @State private var spacing = 5.0
    
    var vm = ProverbViewModel()
    
    var chinese: String {
        "chinese"
    }
    var pinyin: String {
        "pinyin"
    }
    var english: String {
        "english"
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color
                    .black
                    .ignoresSafeArea()
                
                Image("china1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .opacity(opacity)
                
                VStack {
                    VeryCoolTextView(spacing: spacing, text1: chinese, text2: pinyin, text3: english, scale: scale, angle: angle, opacity: opacity)
                    
                    if moveUp {
                        Spacer()
                    }
                }
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            isPresented.toggle()
                        }
                    }, label: {
                        Image("friend")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 75)
                            .clipShape(Capsule())
                            .overlay {
                                Capsule()
                                    .stroke(Color.red, lineWidth: 1)
                            }
                    })
                }
            }
        }
    }
}

#Preview {
    SplashScreenView(isPresented: .constant(true))
}
