//
//  Max.swift
//  ChinNum
//
//  Created by joe on 11/11/24.
//

import Foundation

func myMax(x: Int, y: Int, z: Int) -> Int {
    if x >= y && x >= z {
        x
    } else if y >= x && y >= z {
        y
    } else {
        z
    }
}

/*
 myMax(x: 3, y: 10, z: 7) = 10
 myMax(x: 3, y: 7, z: 10) = 10
 myMax(x: 7, y: 10, z: 3) = 10
 myMax(x: 7, y: 3, z: 10) = 10
 myMax(x: 10, y: 3, z: 7) = 10
 myMax(x: 10, y: 7, z: 3) = 10
 myMax(x: 5, y: 5, z: 5) = 5
 myMax(x: -15, y: 15, z: 0) = 15
 */
