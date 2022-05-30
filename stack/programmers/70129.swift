// https://programmers.co.kr/learn/courses/30/lessons/70129
// 이진 변환 반복하기

import Foundation

func solution(_ s:String) -> [Int] {
    var removedZero = 0
    var transferedAmount = 0
    var binary = s
    while binary != "1" {
        let zeroRemovedBinary = binary.filter{$0 == "1"}
        removedZero += (binary.count - zeroRemovedBinary.count)
        binary = transferIntToBinary(zeroRemovedBinary.count)
        transferedAmount += 1
    }
    
    return [transferedAmount, removedZero]
}

func transferIntToBinary(_ number: Int) -> String {
    var stack = [Int]()
    var number = number
    while true {
        if number == 1 {
            stack.append(1)
            break
        }
        stack.append(number % 2)
        number /= 2
    }
    return stack.reversed().map{String($0)}.joined()
}