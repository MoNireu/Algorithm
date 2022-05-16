// https://www.acmicpc.net/problem/1309
// 동물원

import Foundation


func solution() {
    let n = Int(readLine()!)!
    
    
    var dp = [1, 3]
    
    var dpLastIdx = dp.count - 1
    while dpLastIdx < n {
        dp.append((dp[dpLastIdx] * 2 + dp[dpLastIdx - 1]) % 9901)
        dpLastIdx = dp.count - 1
    }
    print(dp[n])
}

solution()

