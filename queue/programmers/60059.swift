// https://programmers.co.kr/learn/courses/30/lessons/60059
// 자물쇠와 열쇠

import Foundation

typealias grooveIdxListType = [(row: Int, col: Int)]
typealias historyType = [Int]

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    
    var lockGroovePositions: Set<[Int]> = Set()
    for (rowIdx, rowVal) in lock.enumerated() {
        for (colIdx,colVal) in rowVal.enumerated() {
            if colVal == 0 {
                lockGroovePositions.insert([rowIdx, colIdx])
            }
        }
    }
    let lockGrooveAmount = lockGroovePositions.count
    
    var keyGroovePositions: grooveIdxListType = []
    for (rowIdx, rowVal) in key.enumerated() {
        for (colIdx,colVal) in rowVal.enumerated() {
            if colVal == 1 {
                keyGroovePositions.append((rowIdx, colIdx))
            }
        }
    }
    
    if lockGrooveAmount > keyGroovePositions.count { return false }
    if lockGrooveAmount == 0 { return true }
    
    let rotate90 = rotate(keyPositions: keyGroovePositions, size: lock.count)
    let rotate180 = rotate(keyPositions: rotate90, size: lock.count)
    let rotate270 = rotate(keyPositions: rotate180, size: lock.count)
    
    var histories: Set<historyType> = Set([[0,0,0], [90,0,0], [180,0,0], [270,0,0]])
    var queue: [(grooves: grooveIdxListType, history: historyType)] = [
        (keyGroovePositions, [0,0,0]),
        (rotate90, [90,0,0]),
        (rotate180, [180,0,0]),
        (rotate270, [270,0,0])
    ]
    
    while !queue.isEmpty {
        let poped = queue.removeFirst()
        var matchAmount = 0
        for position in poped.grooves {
            if lockGroovePositions.contains([position.row, position.col]) { matchAmount += 1}
            else { matchAmount -= 1}
        }
        if matchAmount == lockGrooveAmount { return true }
        
        for i in [-1, 1] {
            var nextVerticalHistory = poped.history
            nextVerticalHistory[1] += i
            if !histories.contains(nextVerticalHistory) {
                histories.insert(nextVerticalHistory)
                let nextKey = pushVertical(keyPositions: poped.grooves, size: lock.count, direction: i)
                if !nextKey.isEmpty {
                    queue.append((nextKey, nextVerticalHistory))
                }
            }
            var nextHorizontalHistory = poped.history
            nextHorizontalHistory[2] += i
            if !histories.contains(nextHorizontalHistory) {
                histories.insert(nextHorizontalHistory)
                let nextKey = pushHorizontal(keyPositions: poped.grooves, size: lock.count, direction: i)
                if !nextKey.isEmpty {
                    queue.append((nextKey, nextHorizontalHistory))
                }
            }
        }
    }
    return false
}

func rotate(keyPositions: [(row: Int, col: Int)], size: Int) -> [(row: Int, col: Int)] {
    var rotatedKeyPositions: [(row: Int, col: Int)] = []
    for keyPosition in keyPositions {
        rotatedKeyPositions.append((row: abs(size - 1 - keyPosition.col), col: keyPosition.row))
    }
    return rotatedKeyPositions
}

func pushVertical(keyPositions: [(row: Int, col: Int)], size: Int, direction: Int) -> [(row: Int, col: Int)] {
    var rotatedKeyPositions: [(row: Int, col: Int)] = []
    for keyPosition in keyPositions {
        let next = keyPosition.row + direction
        guard next >= 0 && next < size else {continue}
        rotatedKeyPositions.append((row: next, col: keyPosition.col))
    }
    return rotatedKeyPositions
}


func pushHorizontal(keyPositions: [(row: Int, col: Int)], size: Int, direction: Int) -> [(row: Int, col: Int)] {
    var rotatedKeyPositions: [(row: Int, col: Int)] = []
    for keyPosition in keyPositions {
        let next = keyPosition.col + direction
        guard next >= 0 && next < size else {continue}
        rotatedKeyPositions.append((row: keyPosition.row, col: next))
    }
    return rotatedKeyPositions
}