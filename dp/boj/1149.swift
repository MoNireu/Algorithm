// https://www.acmicpc.net/problem/1149
// RGB거리

import Foundation

func solution() {
    let n = Int(readLine()!)!
    
    
    var dp = [[0,0,0]]
    for _ in 0..<n {
        let rgb = readLine()!.components(separatedBy: " ").map{Int($0)!}
        var nextDp = [Int]()
        let dpLast = dp.last!
        nextDp.append(min(dpLast[1], dpLast[2]) + rgb[0])
        nextDp.append(min(dpLast[0], dpLast[2]) + rgb[1])
        nextDp.append(min(dpLast[0], dpLast[1]) + rgb[2])
        dp.append(nextDp)
    }
    
    print(dp.last!.min()!)
    
}

solution()