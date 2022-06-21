// https://programmers.co.kr/learn/courses/30/lessons/42628
// 이중우선순위큐

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
    
    @discardableResult
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
    
    func first() -> T? {
        guard !heap.isEmpty else { return nil }
        return heap[0]
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




func solution(_ operations:[String]) -> [Int] {
    var minQueue = PriorityQueue<Int>(){ $0 < $1 }
    var maxQueue = PriorityQueue<Int>(){ $0 > $1 }
    var totalQueueCount = 0
    var minStack = [Int]()
    var maxStack = [Int]()
    
    for operation in operations {
        let components = operation.components(separatedBy: " ")
        let oper = components[0]
        let value = Int(components[1])!
        
        switch oper {
        case "I":
            minQueue.push(value)
            maxQueue.push(value)
            totalQueueCount += 1
        case "D":
            if value == 1 {
                if let popValue = maxQueue.pop() {
                    maxStack.append(popValue)
                }
            }
            else {
                if let popValue = minQueue.pop() {
                    minStack.append(popValue)
                }
            }
        default:
            break
        }
        
        while !minStack.isEmpty && minStack.last == maxQueue.first() {
            maxQueue.pop()
            minStack.removeLast()
        }
        while !maxStack.isEmpty && maxStack.last == minQueue.first() {
            minQueue.pop()
            maxStack.removeLast()
        }
        print(operation)
        minQueue.print()
        maxQueue.print()
        print("====")
    }
    
    let lastMinPop = minQueue.pop()
    let lastMaxPop = maxQueue.pop()
    
    if lastMinPop == nil && lastMaxPop == nil {
        return [0, 0]
    }
    else if lastMinPop != nil && lastMaxPop == nil {
        return [lastMinPop!, lastMinPop!]
    }
    else if lastMinPop == nil && lastMaxPop != nil {
        return [lastMaxPop!, lastMaxPop!]
    }
    else {
        return [lastMaxPop!, lastMinPop!]
    }
}