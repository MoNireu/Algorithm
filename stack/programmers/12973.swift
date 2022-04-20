// https://programmers.co.kr/learn/courses/30/lessons/12973
// 짝지어 제거하기


import Foundation

func solution(_ s:String) -> Int {
    var stack: [Character] = []
    
    for char in s {
        if stack.isEmpty {
            stack.append(char)
        }
        else {
            if stack.last! == char {
                stack.popLast()
            }
            else {
                stack.append(char)
            }
        }
    }
    
    if stack.isEmpty { return 1 }
    else { return 0 }
}
