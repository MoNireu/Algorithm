// https://www.acmicpc.net/problem/11055
// 가장 큰 증가 부분 수열

import Foundation

func solution() {
    let n = Int(readLine()!)!
    
    let sequenceA = readLine()!.components(separatedBy: " ").map{Int($0)!}
    // [수열 마지막 값, 지금까지의 합]
    var dp = Array(repeating: [0, 0], count: n)
    dp[0] = [sequenceA[0], sequenceA[0]]
    
    for i in 1..<n {
        let lastMax = dp[0...i]
            .filter{$0[0] < sequenceA[i]}
            .max{$0[1] < $1[1]}
        
        dp[i] = [sequenceA[i], sequenceA[i] + lastMax![1]]
    }
    
    print(dp.max{$0[1] < $1[1]}![1])
}

solution()