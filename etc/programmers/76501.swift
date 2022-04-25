// https://programmers.co.kr/learn/courses/30/lessons/76501
// 음양 더하기

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    
    var numbers = absolutes
    
    for index in 0..<signs.count {
        numbers[index] *= signs[index] ? 1 : -1
    }
    
    return numbers.reduce(0, +)
}
