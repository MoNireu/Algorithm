// https://programmers.co.kr/learn/courses/30/lessons/64065
// 튜플


import Foundation

func solution(_ s:String) -> [Int] {
    var answer: [Int] = []
    var tupleString = s
    tupleString.removeFirst()
    tupleString.removeLast()
    var numList: [[Int]] = []
    var elements: [Int] = []
    var numString = ""
    for char in tupleString {
        if isNumber(char) {
            numString += String(char)
        }
        else if char == "," {
            if let num = Int(String(numString)) {
                elements.append(num)
            }
            numString = ""
        }
        else if char == "{" {
            elements = []
        }
        else if char == "}" {
            if let num = Int(String(numString)) {
                elements.append(num)
            }
            numString = ""
            numList.append(elements)
        }
    }
    
    numList = numList.sorted(by: {$0.count < $1.count})
    answer.append(contentsOf: numList[0])
    if numList.count == 1 { return answer }
    for i in 1..<numList.count {
        let newElement = Array(Set(numList[i]).subtracting(Set(answer)))
        answer.append(contentsOf: newElement)
    }
    
    return answer
}


func isNumber(_ char: Character) -> Bool {
    return char.asciiValue! >= Character("0").asciiValue! &&
        char.asciiValue! <= Character("9").asciiValue!
}