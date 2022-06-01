// https://programmers.co.kr/learn/courses/30/lessons/12980
// 점프와 순간 이동

import Foundation

var ans: Int = 2147483647


func solution(_ n:Int) -> Int
{
    var block = n
    var ans = 1
    while block != 1 {
        if block % 2 == 0 {
            block /= 2
        }
        else {
            block -= 1
            ans += 1
        }
    }
    return ans
}