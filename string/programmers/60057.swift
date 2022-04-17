//
//  main.swift
//  algo_swift
//
//  Created by MoNireu on 2022/04/17.
//

import Foundation

func solution(_ s:String) -> Int {
    var resultStringLengths: [Int] = []
    
    for distance in 0...s.count-1 {
        var currentString = ""
        var lastString = ""
        var lastStringCount = 1
        var resultString = ""
        
        for Idx in 0...Int(s.count / (distance + 1))-1 {
            let startIdx = (distance + 1) * Idx
            var endIdx = (distance + 1) * Idx + distance
            if endIdx > s.count-1 { endIdx = s.count-1}
            
            currentString = String(s[s.index(s.startIndex, offsetBy: startIdx)...s.index(s.startIndex, offsetBy: endIdx)])

            if currentString == lastString {
                lastStringCount += 1
            }
            else {
                if lastStringCount < 2 {
                    resultString += lastString
                }
                else {
                    resultString += String(lastStringCount)
                    resultString += lastString
                }
                lastString = currentString
                lastStringCount = 1
            }
        }
        if lastStringCount < 2 {
            resultString += lastString
        }
        else {
            resultString += String(lastStringCount)
            resultString += lastString
        }
        resultString += s[s.index(s.endIndex, offsetBy: -(s.count % (distance+1)))...]
        resultStringLengths.append(resultString.count)
    }
    return resultStringLengths.min()!
}

print(solution("abcabcabcabcdededededede"))


