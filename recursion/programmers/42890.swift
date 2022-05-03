// https://programmers.co.kr/learn/courses/30/lessons/42890
// 후보키

import Foundation

func solution(_ relation:[[String]]) -> Int {
    var uniqueCombinations: Set<[Int]> = Set()
    
    for i in 0..<relation[0].count {
        combinationUniqueAmount(relation,
                                          Array(repeating: "", count: relation.count),
                                          &uniqueCombinations,
                                          [],
                                          lastCombineAmount: 0,
                                          finalCombineAmount: i)
    }
    print(uniqueCombinations)
    return uniqueCombinations.count
}

func combinationUniqueAmount(_ relation: [[String]],
                             _ combinedList: [String],
                             _ uniqueCombinations: inout Set<[Int]>,
                             _ indexHistory: [Int],
                             lastCombineAmount: Int,
                             finalCombineAmount: Int) {
    var nextCombinedList = combinedList
    var nextIndexHistory = indexHistory
    
    if lastCombineAmount > finalCombineAmount {
        if Set(combinedList).count == relation.count {
            uniqueCombinations.insert(nextIndexHistory)
        }
        return
    }
    
    for i in (indexHistory.last ?? -1)+1..<(relation[0].count - finalCombineAmount + lastCombineAmount) {
        nextIndexHistory = indexHistory
        nextCombinedList = combinedList
        nextIndexHistory.append(i)
        var passCurrentIdxCombination = false
        for uniqueCombination in uniqueCombinations {
            if Set(uniqueCombination).intersection(Set(nextIndexHistory)).count == uniqueCombination.count {
                passCurrentIdxCombination = true
                break
            }
        }
        if passCurrentIdxCombination {
            continue
        }
        for j in 0..<nextCombinedList.count {
            nextCombinedList[j] += relation[j][i]
        }
        combinationUniqueAmount(relation, nextCombinedList, &uniqueCombinations, nextIndexHistory, lastCombineAmount: lastCombineAmount + 1, finalCombineAmount: finalCombineAmount)
    }
}