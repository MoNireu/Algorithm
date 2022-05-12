// https://www.acmicpc.net/problem/1753
// 최단경로
// 다익스트라

import Foundation

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



let INF = 2147483647

func solution() {
    var input = readLine()!.components(separatedBy: " ")
    let vertex = Int(input[0])!
    let edgeAmount = Int(input[1])!
    
    let startingVertex = Int(readLine()!)!
    var graph = Array(repeating: Array(repeating: INF, count: vertex + 1), count: vertex + 1)
    
    for _ in 0..<edgeAmount {
        input = readLine()!.components(separatedBy: " ")
        let from = Int(input[0])!
        let to = Int(input[1])!
        let weight = Int(input[2])!
        graph[from][to] = min(weight, graph[from][to])
    }
    
    var shortcut = Array(repeating: INF, count: vertex + 1)
    shortcut[startingVertex] = 0
    
    var pqueue = PriorityQueue<(cost: Int, to: Int)>() { $0.cost < $1.cost }
    pqueue.push((cost: 0, to: startingVertex))
    
    while !pqueue.isEmpty() {
        let popVal = pqueue.pop()!
        if shortcut[popVal.to] < popVal.cost { continue }
        
        for (nextTo, nextCost) in graph[popVal.to].enumerated() {
            if popVal.cost + nextCost < shortcut[nextTo] {
                shortcut[nextTo] = popVal.cost + nextCost
                pqueue.push((cost: popVal.cost + nextCost, to: nextTo))
            }
        }
        
    }
    
    
    for answer in shortcut[1...] {
        print(answer == INF ? "INF" : answer)
    }
}

solution()