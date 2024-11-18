//
//  Chinese.swift
//  ChinNum
//
//  Created by joe on 11/18/24.
//

import Foundation

class Chinese {
    static func num99ToChinese(num: Int) -> (chinese: String, pinyin: String)? {
        let chineseDigitsWithPinyin: [(chinese: String, pinyin: String)] = [
            ("零", "líng"),
            ("一", "yī"),
            ("二", "èr"),
            ("三", "sān"),
            ("四", "sì"),
            ("五", "wǔ"),
            ("六", "liù"),
            ("七", "qī"),
            ("八", "bā"),
            ("九", "jiǔ"),
            ("十", "shí")
        ]
        
        let chineseDigitsWithPinyinEmptyZero: [(chinese: String, pinyin: String)] = [
            ("", ""),
            ("一", "yī"),
            ("二", "èr"),
            ("三", "sān"),
            ("四", "sì"),
            ("五", "wǔ"),
            ("六", "liù"),
            ("七", "qī"),
            ("八", "bā"),
            ("九", "jiǔ"),
            ("十", "shí")
        ]
        
        var chineseResult: String
        var pinyinResult: String
        
        switch num {
        case 0...10:
            chineseResult = chineseDigitsWithPinyin[num].chinese
            pinyinResult = chineseDigitsWithPinyin[num].pinyin
        case 11...19:
            chineseResult = "十\(chineseDigitsWithPinyin[num%10].chinese)"
            pinyinResult = "shí \(chineseDigitsWithPinyin[num%10].pinyin)"
        case 20...99:
            let tenths = num / 10
            let digit = num % 10
            chineseResult = "\(chineseDigitsWithPinyin[tenths].chinese)十\(chineseDigitsWithPinyinEmptyZero[digit].chinese)"
            pinyinResult = "\(chineseDigitsWithPinyin[tenths].pinyin) shí \(chineseDigitsWithPinyinEmptyZero[digit].pinyin)"
        default:
            return nil
        }
        
        pinyinResult = pinyinResult.trimmingCharacters(in: .whitespaces)
        
        return (chineseResult, pinyinResult)
    }
}
