//
//  ChinNumApp.swift
//  ChinNum
//
//  Created by joe on 11/11/24.
//

import SwiftUI

@main
struct ChinNumApp: App {
    @State private var gVM = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(gVM)
        }
    }
}
