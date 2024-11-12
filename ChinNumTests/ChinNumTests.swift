//
//  ChinNumTests.swift
//  ChinNumTests
//
//  Created by joe on 11/11/24.
//

import XCTest
@testable import ChinNum

final class ChinNumTests: XCTestCase {
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

    func testMax() throws {
        // setup data
        let dataArray = [
            (x: 3, y: 10, z: 7),
            (x: 3, y: 7, z: 10),
            (x: 7, y: 10, z: 3),
            (x: 7, y: 3, z: 10),
            (x: 10, y: 3, z: 7),
            (x: 10, y: 7, z: 3),
            (x: 5, y: 5, z: 5),
            (x: -15, y: 15, z: 0)
        ]
        
        // expected values
        let expectecValues = [
            10, 10, 10, 10, 10, 10, 5, 15
        ]
        
        // test
        for i in 0..<dataArray.count {
            let data = dataArray[i]
            let expectedValue = expectecValues[i]
            let evaluatedValue = myMax(x: data.x, y: data.y, z: data.z)
            
            XCTAssertEqual(expectedValue, evaluatedValue)
        }
    }
}
