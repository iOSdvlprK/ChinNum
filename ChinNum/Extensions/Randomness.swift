//
//  Randomness.swift
//  ChinNum
//
//  Created by joe on 11/14/24.
//

import Foundation

/*
 // TODO:
 1) Implement a function
 func generateUniqueRandomIntegers(count: Int) between 0 and 99
 
 2) Create an extension of Int with the same functionality as 1)
 */

extension Int {
    static func generateUniqueRandomIntegers(count: Int, lower: Int = 0, upper: Int = 99) -> [Int] {
        // In case the task is impossible
        if count > upper - lower + 1 || lower > upper {
            return []
        }
        
        var result = [Int]()
        
        while result.count < count {
            let randomInt = Int.random(in: lower...upper)
            
            // Check for uniqueness
            if !result.contains(randomInt) {
                result.append(randomInt)
            }
        }
        
        return result
    }
}
