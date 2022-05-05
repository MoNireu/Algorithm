// https://programmers.co.kr/learn/courses/30/lessons/64062
// 징검다리 건너기

import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    let minCross = 1
    let maxCross = 200000001
    
    var left = minCross
    var right = maxCross
    
    while left <= right {
        let mid = (right + left) / 2
        var removedAmount = 0
        var isCrossComplete = true
        for stone in stones {
            if stone - mid <= 0 {
                removedAmount += 1
            }
            else {
                removedAmount = 0
            }
            if removedAmount == k {
                isCrossComplete = false
                break
            }
        }
        if isCrossComplete {
            left = mid + 1
        }
        else {
            right = mid - 1
        }
    }
    return left
}