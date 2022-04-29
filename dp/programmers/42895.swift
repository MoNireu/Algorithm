// https://programmers.co.kr/learn/courses/30/lessons/42895
// N으로 표현

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var dp: [Set<Int>] = [Set(), Set([N])]
    
    if N == number { return 1 }
    
    for i in 2...8 {
        dp.append(Set<Int>([nDigits(N, i)]))
        for j in 1...i/2 {
            for first in dp[j] {
                if first == 0 {continue}
                for second in dp[i-j] {
                    if second == 0 {continue}
                    dp[i].insert(first + second)
                    dp[i].insert(first * second)
                    dp[i].insert(first - second)
                    dp[i].insert(first / second)
                    dp[i].insert(second - first)
                    dp[i].insert(second / first)
                }
            }
        }
        if dp[i].contains(number) { return i }
    }
    return -1
}


func nDigits(_ n: Int, _ digits: Int) -> Int {
    var result = 0
    for _ in 1...digits {
        result *= 10
        result += n
    }
    return result
}