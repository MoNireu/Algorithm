// https://programmers.co.kr/learn/courses/30/lessons/86971
// 전력망을 둘로 나누기

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var answer = 2147483647
    var fullConnections = Array(repeating: Array<Int>(), count: n+1)
    
    for wire in wires {
        fullConnections[wire[0]].append(wire[1])
        fullConnections[wire[1]].append(wire[0])
    }
    
    print(fullConnections)
    
    for removedWire in wires {
        let connectedNodeAmount = getConnectionCount(removedConnection: removedWire, fullConnectionInfo: fullConnections)
        answer = min(answer, abs(n - connectedNodeAmount * 2))
    }
    
    return answer
}

func getConnectionCount(removedConnection: [Int],
                       fullConnectionInfo: [[Int]]) -> Int {
    
    
    var queue = [removedConnection[0]]
    var history = Set<Int>()
    history.insert(removedConnection[0])
    
    while !queue.isEmpty {
        let popedNode = queue.removeFirst()
        for connectedNode in fullConnectionInfo[popedNode] {
            guard !history.contains(connectedNode) else {continue}
            guard connectedNode != removedConnection[1] else {continue}
            history.insert(connectedNode)
            queue.append(connectedNode)
        }
    }
    return history.count
}
