// https://programmers.co.kr/learn/courses/30/lessons/68645
// 삼각 달팽이

import Foundation

enum Direction {
    case left
    case bottom
    case right
}

var currentIdx = 0
var currentNum = 1
var level = 0
var answer: [Int]!

func solution(_ n:Int) -> [Int] {
    let arrayCount = n * (1 + n) / 2
    answer = Array(repeating: 0, count: arrayCount)
    
    
    var direction = Direction.left
    for processCount in (1...n).reversed() {
        switch direction {
        case .left:
            makeLeft(processCount)
            direction = .bottom
        case .bottom:
            makeBottom(processCount)
            direction = .right
        case .right:
            makeRight(processCount)
            direction = .left
        }
    }
    
    return answer
}

func makeLeft(_ processCount: Int) {
    for _ in 0..<processCount {
        currentIdx += level
        answer[currentIdx] = currentNum
        level += 1
        currentNum += 1
//        print(answer)
    }
}

func makeBottom(_ processCount: Int) {
    for _ in 0..<processCount {
        currentIdx += 1
        answer[currentIdx] = currentNum
        currentNum += 1
//        print(answer)
    }
}

func makeRight(_ processCount: Int) {
    for _ in 0..<processCount {
        currentIdx -= level
        answer[currentIdx] = currentNum
        level -= 1
        currentNum += 1
//        print(answer)
    }
}