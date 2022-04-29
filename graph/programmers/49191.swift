// https://programmers.co.kr/learn/courses/30/lessons/49191
// 순위
// 플로이드 와샬

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var answer = 0
    let INF = 4500
    var graph: [[Int]] = Array(repeating: Array(repeating: INF, count: n+1), count: n+1)
    
    for result in results {
        graph[result[0]][result[1]] = 1
    }
    
    for i in 1...n {
        graph[i][i] = 0
    }
    
    for i in 1...n {
        for j in 1...n {
            if i == j { continue }
            for k in 1...n {
                if i == k { continue}
                if j == k { continue }
                graph[j][k] = min(graph[j][k], graph[j][i] + graph [i][k])
            }
        }
    }
    
    for i in 1...n {
        for j in 1...n {
            if graph[i][j] != INF {
                graph[j][i] = -graph[i][j]
            }
        }
    }
    
    answer = graph.filter{$0.filter{$0 != 0 && $0 != INF}.count == n-1}.count
    return answer
}