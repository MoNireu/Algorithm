// https://www.acmicpc.net/problem/15988
// 1, 2, 3 더하기 3

import Foundation


func solution() {
    let t = Int(readLine()!)!
    
    
    var dp = [0, 1, 2, 4]
    
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var dpLastIdx = dp.count - 1
        while dpLastIdx < n {
            dp.append((dp[dpLastIdx] + dp[dpLastIdx - 1] + dp[dpLastIdx - 2]) % 1000000009)
            dpLastIdx = dp.count - 1
        }
        print(dp[n])
    }
    
    return
}

solution()

