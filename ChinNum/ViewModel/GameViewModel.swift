//
//  GameViewModel.swift
//  ChinNum
//
//  Created by joe on 11/15/24.
//

import Foundation
import Observation
import AVFoundation

@Observable
class GameViewModel {
    var gameModel: GameModel = .defaultGameModel
    var audioPlayer: AVAudioPlayer?
    
    func randomExpressionOfJoy() {
        playSound(name: ["awesome", "bell", "correct", "whoop", "yes"].randomElement() ?? "whoop")
    }
    
    func incorrectSound() {
        playSound(name: ["OhNo", "incorrectAnswer", "weak"].randomElement() ?? "incorrectAnswer")
    }
    
    func playNumber(num: Int) {
        // TODO: playNumber
    }
    
    private func playDigit(num: Int) {
        // TODO: playDigit
    }
    
    private func digitToName(digit: Int) -> String? {
        return nil  // TODO: digitToName
    }
    
    // Play sounds and digits
    private func playSound(name: String, ext: String = "aiff") {
        guard let soundURL = Bundle.main.url(forResource: name, withExtension: ext) else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = gameModel.volume
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
