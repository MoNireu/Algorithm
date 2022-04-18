// https://programmers.co.kr/learn/courses/30/lessons/64061
// 크레인 인형뽑기 게임

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var dollStacks: [[Int]] = []
    var basket: [Int] = []
    var result = 0
    for _ in 0...board.count {
        dollStacks.append([])
    }
    for dolls in board.reversed() {
        for (index, doll) in dolls.enumerated() {
            if doll != 0 {
                dollStacks[index+1].append(doll)
            }
        }
    }
    
    for move in moves {
        guard let pop = dollStacks[move].popLast() else { continue }
        guard let basketLast = basket.last else {
            basket.append(pop)
            continue
        }
        if basketLast == pop {
            basket.popLast()
            result += 2
        }
        else {
            basket.append(pop)
        }
    }
    
    return result
}
