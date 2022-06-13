// https://programmers.co.kr/learn/courses/30/lessons/12909
// 올바른 괄호

import Foundation

func solution(_ s:String) -> Bool
{
    var bracket = 0
    
    for char in s {
        bracket = char == "(" ? bracket + 1 : bracket - 1
        if bracket < 0 { return false }
    }
    
    return bracket == 0
}