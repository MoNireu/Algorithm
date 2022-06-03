// https://programmers.co.kr/learn/courses/30/lessons/84512
// 모음 사전

import Foundation

var count = 0
var resultFound = false
let alphabets = ["A", "E", "I", "O", "U"]

func solution(_ word:String) -> Int {
    
    findOrder(currentString: "", targetString: word, starting: 0)
    
    return count
}

func findOrder(currentString: String, targetString: String, starting: Int) {
    if currentString.count >= 6 { return }
    if resultFound { return }
    if targetString == currentString {
        resultFound = true
        return
    }
    count += 1
    for i in starting..<5 {
        findOrder(currentString: currentString + alphabets[i], targetString: targetString, starting: 0)
    }
}