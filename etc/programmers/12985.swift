// https://programmers.co.kr/learn/courses/30/lessons/12985
// 예상 대진표

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 1
    var personA = a
    var personB = b
    while true {
        if !isEven(personA) { personA += 1}
        if !isEven(personB) { personB += 1}
        
        personA /= 2
        personB /= 2
        
        if personA == personB { break }
        answer += 1
    }
    
    return answer
}

func isEven(_ num: Int) -> Bool {
    return num % 2 == 0
}