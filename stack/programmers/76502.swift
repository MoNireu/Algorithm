// https://programmers.co.kr/learn/courses/30/lessons/76502
// 괄호 회전하기

import Foundation

func solution(_ s:String) -> Int {
    var string = s
    var answer = 0
    for _ in 0..<s.count {
        print(string)
        answer += isCorrectBracket(string) ? 1 : 0
        string.append(string.removeFirst())
    }
    return answer
}

func isCorrectBracket(_ brackets: String) -> Bool {
    var stack: [Character] = []
    for bracket in brackets {
        if !stack.isEmpty &&
            ((stack.last! == "[" && bracket == "]") ||
             (stack.last! == "{" && bracket == "}") ||
             (stack.last! == "(" && bracket == ")")) {
            stack.popLast()
        }
        else {
            stack.append(bracket)
        }
    }
    print("stack = \(stack)")
    return stack.isEmpty
}