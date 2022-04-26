// https://programmers.co.kr/learn/courses/30/lessons/86051
// 없는 숫자 더하기

import Foundation

func solution(_ numbers:[Int]) -> Int {
    var answer = 0
    for i in 1...9 {
        answer += i
    }
    answer -= numbers.reduce(0, +)
    return answer
}