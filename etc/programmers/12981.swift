// https://programmers.co.kr/learn/courses/30/lessons/12981
// 영어 끝말잇기

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var wordHistory: Set<String> = Set()
    var lastWordLast = words.first!.first!
    
    for (index,word) in words.enumerated() {
        if !wordHistory.contains(word) && lastWordLast == word.first! {
            wordHistory.insert(word)
            lastWordLast = word.last!
        }
        else {
            return [index % n + 1, index / n + 1]
        }
    }
    return [0, 0]
}