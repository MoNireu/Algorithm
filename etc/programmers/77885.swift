// https://programmers.co.kr/learn/courses/30/lessons/77885
// 2개 이하로 다른 비트

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var answer = [Int64]()
    
    for number in numbers {
        let firstIndexOfZero = getFirstIndexOfZeroFrom(number: number)
        var numberToAdd: Int64 {
            if firstIndexOfZero == 0 {
                return 1
            }
            else {
                return Int64(pow(2.0, Float(firstIndexOfZero - 1)))
            }
        }
        answer.append(number + numberToAdd)
    }
    
    return answer
}

func getFirstIndexOfZeroFrom(number: Int64) -> Int {
    if number == 0 { return 0 }
    
    var num = number
    var index = 0
    
    while num != 1 {
        if num % 2 == 0 {
            return index
        }
        index += 1
        num /= 2
    }
    
    return index + 1
}