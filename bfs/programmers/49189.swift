// https://programmers.co.kr/learn/courses/30/lessons/49189
// 가장 먼 노드

import Foundation

func solution(_ n:Int, _ edges:[[Int]]) -> Int {
    var graph: [[Int]] = []
    var distance: [Int] = []
    var maxDistance = 0
    var maxDistanceAmount = 1
    
    for _ in 0...n {
        graph.append([])
        distance.append(0)
    }
    distance[1] = 1
    
    for edge in edges {
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }
    
    var queue: [(node: Int, distance: Int)] = [(1, 0)]
    while !queue.isEmpty {
        let popValue = queue.removeFirst()
        let currentNode = popValue.node
        let currentDistance = popValue.distance
        let nextNodes = graph[currentNode]
        let nextDistance = currentDistance + 1
        for nextNode in nextNodes {
            if distance[nextNode] == 0 {
                distance[nextNode] = nextDistance
                queue.append((nextNode, nextDistance))
                if nextDistance == maxDistance { maxDistanceAmount += 1}
                else if nextDistance > maxDistance {
                    maxDistance = nextDistance
                    maxDistanceAmount = 1
                }
            }
        }
    }
    return maxDistanceAmount
}

