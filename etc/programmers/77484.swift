//
//  main.swift
//  algo_swift
//
//  Created by MoNireu on 2022/04/17.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var unknownAmount = 0
    var correctAmouont = 0
    var answer: [Int] = []
    for lotto in lottos {
        guard lotto != 0 else {
            unknownAmount += 1
            continue
        }
        
        if win_nums.contains(lotto) {
            correctAmouont += 1
        }
    }
    
    let bestTotal = unknownAmount+correctAmouont
    answer.append(getRank(total: bestTotal))
    answer.append(getRank(total: correctAmouont))
    
    print(answer)
    return answer
}

func getRank(total: Int) -> Int {
    if total <= 1 {
        return 6
    }
    return 7 - total
}


solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19])


