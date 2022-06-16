// https://programmers.co.kr/learn/courses/30/lessons/72413
// 합승 택시 요금
// 플로이드 와샬

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    let MAX = 1000000 * n + 1
    var routeFares = Array(repeating: Array(repeating: MAX, count: n+1), count: n+1)
    
    for fare in fares {
        let from = fare[0]
        let to = fare[1]
        let fare = fare[2]
        routeFares[from][to] = fare
        routeFares[to][from] = fare
    }
    
    for i in 1...n {
        routeFares[i][i] = 0
    }
    
    var minCost = MAX
    
    
    for mid in 1...n {
        for from in 1...n {
            for to in 1...n {
                let startToMid = routeFares[from][mid]
                let midToEnd = routeFares[mid][to]
                
                guard startToMid != MAX && midToEnd != MAX else { continue }
                routeFares[from][to] = min(routeFares[from][to], startToMid + midToEnd)
            }
        }
    }
    
    for i in 1...n {
        let startToMid = routeFares[s][i]
        let midToA = routeFares[i][a]
        let midToB = routeFares[i][b]
        
        guard startToMid != MAX &&
                midToA != MAX &&
                midToB != MAX else { continue }
        
        let newCost = startToMid + midToA + midToB
        minCost = min(minCost, newCost)
    }
    
    return minCost
}