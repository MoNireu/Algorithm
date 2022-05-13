// https://www.acmicpc.net/problem/1655
// 가운데를 말해요

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
    
    func print() {
        Swift.print(heap)
    }
    
    func count() -> Int {
        return heap.count
    }
    
    func element(at index: Int) -> T? {
        if index >= heap.count {
            return nil
        }
        else {
            return heap[index]
        }
    }
    
    func first() -> T? {
        return heap.first
    }
    
    private mutating func sortAfterPush() {
        var currentIndex = heap.count-1
        var parentIndex: Int {
            return (currentIndex + 1) / 2 - 1
        }
        while currentIndex != 0 {
            if sortBy(heap[currentIndex], heap[parentIndex]) {
                heap.swapAt(parentIndex, currentIndex)
            }
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


func solution() {
    let amount = Int(readLine()!)!
    
    var pqLeft = PriorityQueue<Int>(){ $0 > $1 }
    var pqRight = PriorityQueue<Int>(){ $0 < $1 }
    pqLeft.push(-10001)
    pqRight.push(10001)
    
    for _ in 0..<amount {
        let input = Int(readLine()!)!
        if pqLeft.count() > pqRight.count() {
            pqRight.push(input)
        }
        else {
            pqLeft.push(input)
        }
        
        if pqLeft.first()! > pqRight.first()! {
            let pqLeftFirst = pqLeft.pop()!
            let pqRightFirst = pqRight.pop()!
            pqLeft.push(pqRightFirst)
            pqRight.push(pqLeftFirst)
        }
        print(pqLeft.first()!)
    }
}

solution()