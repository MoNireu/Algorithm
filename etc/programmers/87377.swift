// https://programmers.co.kr/learn/courses/30/lessons/87377
// 교점에 별 만들기

import Foundation

struct Intersection: Hashable {
    let x: Int
    let y: Int
}

func solution(_ lines:[[Int]]) -> [String] {
    var intersections = Set<Intersection>()
    var minx = Int.max
    var maxx = Int.min
    var miny = Int.max
    var maxy = Int.min
    // 교점 구하기
    for i in 0..<lines.count-1 {
        for j in i+1..<lines.count {
            let a = lines[i][0]
            let b = lines[i][1]
            let e = lines[i][2]
            let c = lines[j][0]
            let d = lines[j][1]
            let f = lines[j][2]
            
            let adbc = a*d - b*c
            guard adbc != 0 else { continue }

            let bfed = b*f - e*d
            guard bfed % adbc == 0 else {continue}
            
            let ecaf = e*c - a*f
            guard ecaf % adbc == 0 else {continue}
            
            let x = bfed / adbc
            let y = ecaf / adbc
            
            minx = min(minx, x)
            maxx = max(maxx, x)
            miny = min(miny, y)
            maxy = max(maxy, y)
            intersections.insert(Intersection(x: x, y: y))
        }
    }
    
    let xLength = maxx - minx
    let yLength = maxy - miny
    
    var dots = Array(repeating: Array(repeating: ".", count: xLength+1), count: yLength+1)
    for intersection in intersections {
        let x = intersection.x - minx
        let y = -(intersection.y - maxy)
        dots[y][x] = "*"
    }
    
    let result = dots.map{$0.joined()}
    return result
}

func isInteger(_ float: Float) -> Bool {
    return floorf(float) == float
}