// https://programmers.co.kr/learn/courses/30/lessons/81302
// 거리두기 확인하기

import Foundation

let partitionCheckPreset = [[-1, 0], [1, 0], [0, -1], [0, 1]] // [top, bot, left, right]
let personCheckPreset = [
    [[0, 0], [0, -1], [0, 1], [-1, 0]], // top: [myPosition, left, right, forward]
    [[0, 0], [0, -1], [0, 1], [1, 0]], // bottom: [myPosition, left, right, forward]
    [[0, 0], [-1, 0], [1, 0], [0, -1]],// left: [myPosition, top, bottom, forward]
    [[0, 0], [-1, 0], [1, 0], [0, 1]]// right: [myPosition, top, bottom, forward]
]

func solution(_ places:[[String]]) -> [Int] {
    var answer: [Int] = []
    for place in places {
        var isPlaceSafe = true
        for (rowIdx, row) in place.enumerated() {
            for (colIdx, col) in row.enumerated() {
                guard col == "P" else {continue}
                // 상하좌우 파티션 체크
                let checkResults = checkNearByPartitions(place: place, row: rowIdx, col: colIdx)
                
                for (safeCheckIdx, checkResult) in checkResults.enumerated() {
                    guard checkResult == false else {continue}
                    let newRowIdx = rowIdx + partitionCheckPreset[safeCheckIdx][0]
                    let tmpColIdx = colIdx + partitionCheckPreset[safeCheckIdx][1]
                    for i in personCheckPreset[safeCheckIdx] {
                        guard isInIndexRange(newRowIdx + i[0], tmpColIdx + i[1]) else { continue }
                        let newColIdx = place[newRowIdx + i[0]].index(place[newRowIdx + i[0]].startIndex, offsetBy: tmpColIdx + i[1])
                        if place[newRowIdx + i[0]][newColIdx] == "P" {
                            isPlaceSafe = false
                            answer.append(0)
                            break
                        }
                    }
                    if !isPlaceSafe { break }
                }
                if !isPlaceSafe { break }
            }
            if !isPlaceSafe { break }
        }
        if isPlaceSafe { answer.append(1)}
    }
    
    return answer
}

func checkNearByPartitions(place: [String], row: Int, col: Int) -> [Bool] {
    var safeResults = [true, true, true, true] // [top, bot, left, right]
    
    for i in 0..<4 {
        let newRowIdx = row + partitionCheckPreset[i][0]
        let tmpColIdx = col + partitionCheckPreset[i][1]
        guard isInIndexRange(newRowIdx, tmpColIdx) else {continue}
        let startIdx = place[newRowIdx].startIndex
        let newColIdx = place[newRowIdx].index(startIdx, offsetBy: tmpColIdx)
        safeResults[i] = place[newRowIdx][newColIdx] == "X"
    }
    
    return safeResults
}

func isInIndexRange(_ rowIdx: Int, _ colIdx: Int) -> Bool {
    return rowIdx >= 0 && rowIdx < 5 && colIdx >= 0 && colIdx < 5
}
