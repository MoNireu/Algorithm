// https://programmers.co.kr/learn/courses/30/lessons/81303
// 표 편집

import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var chart: [[Int?]] = []
    var answer: [String] = []
    for i in 0..<n {
        chart.append([i-1, i+1])
        answer.append("O")
    }
    chart[0][0] = nil
    chart[n-1][1] = nil
    var deletedStack: [Int] = []
    var pointer: Int? = k
    
    for command in cmd {
        let moveCmd = command.components(separatedBy: " ").first!
        var moveAmount: Int!
        if moveCmd == "U" || moveCmd == "D" { moveAmount = Int(command.components(separatedBy: " ").last!)! }
        
        switch moveCmd {
        case "U":
            for _ in 0..<moveAmount {
                pointer = chart[pointer!][0]
            }
            break
        case "D":
            for _ in 0..<moveAmount {
                pointer = chart[pointer!][1]!
            }
            break
        case "C":
            deletedStack.append(pointer!)
            if let beforePointer = chart[pointer!][0] {
                chart[beforePointer][1] = chart[pointer!][1]
            }
            if let afterPointer = chart[pointer!][1] {
                chart[afterPointer][0] = chart[pointer!][0]
                pointer = afterPointer
            }
            else {
                pointer = chart[pointer!][0]
            }
            break
        case "Z":
            let popValue = deletedStack.popLast()!
            if let beforePointer = chart[popValue][0] {
                chart[beforePointer][1] = popValue
            }
            if let afterPointer = chart[popValue][1] {
                chart[afterPointer][0] = popValue
            }
            break
        default:
            break
        }
    }

    while !deletedStack.isEmpty {
        let popValue = deletedStack.popLast()!
        answer[popValue] = "X"
    }
    return answer.joined()
}
