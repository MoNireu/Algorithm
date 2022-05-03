// https://programmers.co.kr/learn/courses/30/lessons/42889
// 실패율

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var answer: [Int] = []
    var failureRate: [Int: Float] = [:]
    var stagesCount: [Int] = [0]
    
    for n in 1...N {
        failureRate[n] = 0.0
        stagesCount.append(0)
    }
    stagesCount.append(0)
    
    for stage in stages {
        if stage > 0 && stage <= N {
            stagesCount[stage] += 1
        }
        else {
            stagesCount[N+1] += 1
        }
    }
    
    for i in 1...N {
        if stagesCount[i] == 0 {
            failureRate[i] = 0
        }
        else {
            failureRate[i] = Float(stagesCount[i]) / Float(stagesCount[i...].reduce(0, +))
        }
    }
    
    answer = failureRate.sorted { first, second in
        if first.value > second.value {
            return true
        }
        else if first.value == second.value {
            if first.key < second.key {
                return true
            }
        }
        return false
    }.map {$0.key}
    
    return answer
}