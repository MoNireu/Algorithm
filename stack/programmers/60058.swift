// https://programmers.co.kr/learn/courses/30/lessons/60058
// 괄호 변환

import Foundation

func solution(_ p:String) -> String {
    
    if p.isEmpty { return p }
    
    var open = 0
    var close = 0
    var u = p
    var v = ""
    
    for (index, bracket) in p.enumerated() {
        if bracket == "(" { open += 1 }
        else { close += 1 }
        
        if open == close {
            u = String(p[p.startIndex...p.index(p.startIndex, offsetBy: index)])
            v = String(p[p.index(p.startIndex, offsetBy: index + 1)...])
            break
        }
    }
    
    if isCorrectBracketString(u) {
        return u + solution(v)
    }
    else {
        var modifiedString = "("
        modifiedString += solution(v)
        modifiedString += ")"
        
        var flippedU = u
        flippedU.removeFirst()
        flippedU.removeLast()
        flippedU = flippedU.map({ bracket in
            if bracket == "(" { return ")" }
            else { return "(" }
        }).joined()
        
        modifiedString += flippedU
        return modifiedString
    }
}

func isCorrectBracketString(_ str: String) -> Bool {
    var stack: [String] = []
    for bracket in str {
        if !stack.isEmpty && stack.last! == "(" && bracket == ")" {
            stack.removeLast()
        }
        else {
            stack.append(String(bracket))
        }
    }
    return stack.isEmpty
}