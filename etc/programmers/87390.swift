// https://programmers.co.kr/learn/courses/30/lessons/87390
// n^2 배열 자르기

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var array = Array(repeating: 0, count: Int(right - left) + 1)
    
    for i in left...right {
        let row = Int(i / Int64(n))
        let col = Int(i % Int64(n))
        let index = Int(i - left)
        array[index] = max(row, col) + 1
    }

    
    return array
}