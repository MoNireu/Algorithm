// https://www.acmicpc.net/problem/12865
// 평범한 배낭
// 냅색

import Foundation

solution()

func solution() {
    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let amount = input[0]
    let maxWeight = input[1]
    var propList: [[Int]] = []
    for _ in 0..<amount {
        propList.append(readLine()!.components(separatedBy: " ").map{Int($0)!})
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: maxWeight + 1), count: amount + 1)

    for propIndex in 1...amount {
        for weight in 1...maxWeight {
            if propList[propIndex-1][0] <= weight {
                dp[propIndex][weight] = max(dp[propIndex-1][weight - propList[propIndex-1][0]] + propList[propIndex-1][1], dp[propIndex-1][weight])
            }
            else {
                dp[propIndex][weight] = max(dp[propIndex][weight-1], dp[propIndex-1][weight])
            }
        }
    }
    
    print(dp.last!.last!)
}