//
//  ProverbModel.swift
//  ChinNum
//
//  Created by joe on 11/21/24.
//

import Foundation

// https://chinese-proverbs.onrender.com/api/proverbs/random

/*
 {
     "_id": "63e6ae053bd28e8c186fdf2c",
     "proverb": "良药苦口。",
     "pinyin": "Liáng yào kǔ kǒu",
     "translation": "Good medicine tastes bitter."
 }
 */

// let proverbModel = try? JSONDecoder().decode(ProverbModel.self, from: jsonData)

struct ProverbModel: Codable {
    let id, proverb, pinyin, translation: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case proverb, pinyin, translation
    }
    
    static func defaultQuote() -> ProverbModel {
        ProverbModel(
            id: "63e6ae053bd28e8c186fdf2c",
            proverb: "良药苦口。",
            pinyin: "Liáng yào kǔ kǒu",
            translation: "Good medicine tastes bitter."
        )
    }
}
