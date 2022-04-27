// https://programmers.co.kr/learn/courses/30/lessons/17677
// 뉴스 클러스터링

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let multiSetStr1 = getMultisetFrom(str1).sorted()
    let multiSetStr2 = getMultisetFrom(str2).sorted()
    
    var pointer1 = 0
    var pointer2 = 0
    var intersection = 0
    var sumOfSet = 0
    
    while true {
        if pointer1 == multiSetStr1.count {
            sumOfSet += multiSetStr2.count - pointer2
            break
        }
        if pointer2 == multiSetStr2.count {
            sumOfSet += multiSetStr1.count - pointer1
            break
        }
        
        let element1 = multiSetStr1[pointer1]
        let element2 = multiSetStr2[pointer2]
        if element1 < element2 {
            sumOfSet += 1
            pointer1 += 1
        }
        else if element1 > element2 {
            sumOfSet += 1
            pointer2 += 1
        }
        else {
            pointer1 += 1
            pointer2 += 1
            intersection += 1
            sumOfSet += 1
        }
    }
    
    if intersection == 0 && sumOfSet == 0 {
        return 65536
    }
    let answer = floor(Double(intersection) / Double(sumOfSet) * 65536)
    return Int(answer)
}

func getMultisetFrom(_ str: String) -> [String] {
    var result: [String] = []
    let string = str.lowercased()
    let startIdx = string.startIndex
    for i in 0..<string.count-1 {
        let frontCharIdx = string.index(startIdx, offsetBy: i)
        let rearCharIdx = string.index(startIdx, offsetBy: i+1)
        if isAlphabet(string[frontCharIdx]) && isAlphabet(string[rearCharIdx]) {
            result.append(String(string[frontCharIdx...rearCharIdx]))
        }
    }
    return result
}

func isAlphabet(_ char: Character) -> Bool {
    guard let ascii = char.asciiValue else { return false }
    return ascii >= Character("a").asciiValue! && ascii <= Character("z").asciiValue!
}