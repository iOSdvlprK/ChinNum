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
    private var audioPlayer: AVAudioPlayer?
    
    func randomExpressionOfJoy() {
        playSound(name: ["awesome", "bell", "correct", "whoop", "yes"].randomElement() ?? "whoop")
    }
    
    func incorrectSound() {
        playSound(name: ["OhNo", "incorrectAnswer", "weak"].randomElement() ?? "incorrectAnswer")
    }
    
    // playNumber receives a number between 0 and 99 and plays the sound.
    // If the number is outside that range, then play "bell"
    func playNumber(num: Int) {
        switch num {
        case 0...10:
            playDigit(digit: num)
        case 11...19:
            playDigit(digit: 10)
            playDigit(digit: num % 10)
        case 20...99:
            let digit = num % 10
            let tenths = num / 10 // integer division
            playDigit(digit: tenths)
            playDigit(digit: 10)
            if digit != 0 {
                playDigit(digit: digit)
            }
        default:
            playSound(name: "bell")
        }
    }
    
    private func playDigit(digit: Int) {
        playSound(name: digitToName(digit: digit) ?? "bell")
    }
    
    private func digitToName(digit: Int) -> String? {
        let digitNames = [
            "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"
        ]
        
        if digit >= 0 && digit <= 10 {
            return digitNames[digit]
        }
        
        return nil
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
