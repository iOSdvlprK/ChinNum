//
//  GameModel.swift
//  ChinNum
//
//  Created by joe on 11/13/24.
//

import Foundation

struct GameModel {
    var score: Int
    let maxTurns: Int
    var volume: Float
    var turns: Int // turns played so far
    var answer: Int
    var alternatives: [Int] // possible solutions including answer
    var gameWon: Bool {
        turns >= maxTurns
    }
    var gameOver: Bool {
        score < 0 || gameWon
    }
    
    // score code
    mutating func increaseScore() {
        score += 1
    }
    
    // update turn
    mutating func nextTurn() {
        turns += 1
    }
    
    mutating func generateNewProblem() {
        // TODO: implement this part...
        // Create an array of four different random values between 0 and 99
        alternatives = Int.generateUniqueRandomIntegers(count: 4)
        
        // Let the last alternative be the answer
        answer = alternatives[3]
        
        // Shuffle the alternatives so that the solution appears in a different position
        alternatives = alternatives.shuffled()
    }
    
    static var defaultGameModel: GameModel {
        .init(
            score: 0,
            maxTurns: 5,
            volume: 0.7,
            turns: 0,
            answer: 10,
            alternatives: [42, 13, 7, 10].shuffled()
        )
    }
}
