// https://www.acmicpc.net/problem/16639
// 괄호 추가하기 3

import Foundation

solution()

let MIN = 2147483647
let MAX = -2147483648
var answer = 0
func solution() {
    var nums: [Int] = []
    var ops: [String] = []
    var dp: [[[Int]]] = []
    
    let _ = Int(readLine()!)!
    let stringInput = readLine()!
    var numFlag = true
    for string in stringInput {
        let string = String(string)
        if numFlag {
            nums.append(Int(string)!)
        }
        else {
            ops.append(string)
        }
        numFlag = !numFlag
    }
    
    for (index, num) in nums.enumerated() {
        var elements = Array(repeating: [MIN, MAX], count: nums.count)
        elements[index] = [num, num]
        dp.append(elements)
    }
    
    
    for k in 0..<ops.count {
        for i in 0..<ops.count - k {
            var tmp: [Int] = []
            for j in i...i+k {
                let previousRowValue = dp[i][j]
                let previousColValue = dp[j+1][i+k+1]
                tmp.append(calculate(ops[j], firstNum: previousRowValue[0], secondNum: previousColValue[0]))
                tmp.append(calculate(ops[j], firstNum: previousRowValue[0], secondNum: previousColValue[1]))
                tmp.append(calculate(ops[j], firstNum: previousRowValue[1], secondNum: previousColValue[0]))
                tmp.append(calculate(ops[j], firstNum: previousRowValue[1], secondNum: previousColValue[1]))
            }
            dp[i][i+k+1][0] = min(tmp.min()!, dp[i][i+k+1][0])
            dp[i][i+k+1][1] = max(tmp.max()!, dp[i][i+k+1][1])
        }
    }
    
    print(dp.first!.last!.last!)
    return
}

func calculate(_ op: String, firstNum: Int, secondNum: Int) -> Int {
    switch op {
    case "+":
        return firstNum + secondNum
    case "-":
        return firstNum - secondNum
    case "*":
        return firstNum * secondNum
    default:
        return 0
    }
}