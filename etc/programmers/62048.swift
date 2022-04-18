// https://programmers.co.kr/learn/courses/30/lessons/62048
// 멀쩡한 사각형

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
//    let inclination = Double(h) / Double(w)
    for i in 1...w {
        let i = Double(i)
        let h = Double(h)
        let w = Double(w)
        let topPoint = Int(floor(h * (i-1) / w))
        let bottomPoint = Int(ceil(h * i / w))
        answer += Int64(bottomPoint - topPoint)
    }
    return Int64(h * w) - answer
}

print(solution(8, 12))
