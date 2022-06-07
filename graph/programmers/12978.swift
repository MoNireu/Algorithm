// https://programmers.co.kr/learn/courses/30/lessons/12978
// 배달
// 다익스트라

import Foundation

let MAX = 2147483647

struct PriorityQueue<T> {
    private var heap: [T] = []
    private let sortBy: (_ first: T, _ second: T) -> Bool
    init(_ sortBy: @escaping (_ first: T, _ second: T) -> Bool) {
        self.sortBy = sortBy
    }
    
    mutating func push(_ value: T) {
        heap.append(value)
        sortAfterPush()
    }
    
    mutating func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        let returnValue = heap.first!
        heap[0] = heap.last!
        heap.removeLast()
        sortAfterPop()
        return returnValue
    }
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    func print() {
        Swift.print(heap)
    }
    
    private mutating func sortAfterPush() {
        var currentIndex = heap.count-1
        var parentIndex: Int {currentIndex / 2}
        while true {
            guard sortBy(heap[currentIndex], heap[parentIndex]) &&
                    currentIndex != 0 else { break }
            
            heap.swapAt(parentIndex, currentIndex)
            currentIndex = parentIndex
        }
    }
    
    private mutating func sortAfterPop() {
        guard !heap.isEmpty else { return }
        var currentIndex = 0
        var leftIndex: Int { currentIndex * 2 + 1}
        var rightIndex: Int { currentIndex * 2 + 2}
        while true {
            var largestIndex = currentIndex
            if leftIndex < heap.count && sortBy(heap[leftIndex], heap[currentIndex]) {
                largestIndex = leftIndex
            }
            if rightIndex < heap.count && sortBy(heap[rightIndex], heap[largestIndex]) {
                largestIndex = rightIndex
            }
            
            if largestIndex == currentIndex {
                break
            }
            heap.swapAt(currentIndex, largestIndex)
            currentIndex = largestIndex
        }
    }
}


struct EdgeInfo {
    let destination: Int
    let weight: Int
}

struct NodeInfo {
    let node: Int
    let totalWeight: Int
}

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    var graph = Array(repeating: [EdgeInfo](), count: N+1)
    for road in road {
        graph[road[0]].append(EdgeInfo(destination: road[1], weight: road[2]))
        graph[road[1]].append(EdgeInfo(destination: road[0], weight: road[2]))
    }
    
    var totalWeight = Array(repeating: MAX, count: N+1)
    totalWeight[1] = 0
    
    var pqueue = PriorityQueue<NodeInfo>(){$0.totalWeight < $1.totalWeight}
    pqueue.push(NodeInfo(node: 1, totalWeight: 0))
    
    while !pqueue.isEmpty() {
        let currentNodeInfo = pqueue.pop()!
        for nextNodeInfo in graph[currentNodeInfo.node] {
            let nextNode = nextNodeInfo.destination
            let weight = nextNodeInfo.weight
            
            if totalWeight[nextNode] > totalWeight[currentNodeInfo.node] + weight {
                totalWeight[nextNode] = totalWeight[currentNodeInfo.node] + weight
                pqueue.push(NodeInfo(node: nextNode, totalWeight: totalWeight[nextNode]))
            }
        }
    }
    
    answer = totalWeight.filter{$0 <= k}.count
    

    return answer
}