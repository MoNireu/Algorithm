// https://programmers.co.kr/learn/courses/30/lessons/12911
// 다음 큰 숫자

import Foundation

func solution(_ n:Int) -> Int
{
    var value = n
    let initalOneAmount = String(n, radix: 2).filter{$0 == "1"}.count
    while true {
        value += 1
        let nextOneAmount = String(value, radix: 2).filter{$0 == "1"}.count
        if nextOneAmount == initalOneAmount { return value }
    }
}