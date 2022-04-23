// https://programmers.co.kr/learn/courses/30/lessons/92335
// k진수에서 소수 개수 구하기

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var result = 0
    let transformedNotation = transformNotation(n, to: k)
    
    let numberList = transformedNotation.components(separatedBy: "0")
    
    for number in numberList {
        guard !number.isEmpty else {continue}
        if isPrimeNumber(Int(number)!) {
            result += 1
        }
    }

    return result
}

func transformNotation(_ num: Int, to notation: Int) -> String {
    var n: Int = num
    var stack: [Int] = []
    var answer = ""
    while true {
        if n >= notation {
            stack.append(n % notation)
            n /= notation
        }
        else {
            stack.append(n)
            break
        }
    }
    
    while !stack.isEmpty {
        answer += String(stack.popLast()!)
    }
    
    return answer
}

func isPrimeNumber(_ num: Int) -> Bool {
    guard num > 3 else {
        if num > 1 { return true }
        else { return false }
    }
    for i in 2...Int(pow(Double(num), 1/2)) {
        if num % i == 0 { return false }
    }
    return true
}



let n = 110011
let k = 10

print(solution(n, k))
