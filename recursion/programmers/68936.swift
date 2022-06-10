// https://programmers.co.kr/learn/courses/30/lessons/68936
// 쿼드압축 후 개수 세기

import Foundation

struct Area {
    let startRow: Int
    let startCol: Int
    let endRow: Int
    let endCol: Int
}

var zeroCnt = 0
var oneCnt = 0

func solution(_ arr:[[Int]]) -> [Int] {
    sliceAndCompress(arr)
    
    return [zeroCnt, oneCnt]
}

func sliceAndCompress(_ arr: [[Int]]) {
    if canCompress(arr) {
        if arr[0][0] == 0 {
            zeroCnt += 1
        }
        else {
            oneCnt += 1
        }
    }
    else {
        slice(arr)
    }
}

func canCompress(_ arr: [[Int]]) -> Bool {
    let last = arr[0][0]
    for i in 0..<arr.count {
        for j in 0..<arr.count {
            if last != arr[i][j] { return false }
        }
    }
    return true
}

func slice(_ arr: [[Int]]) {
    let mid = arr.count / 2
    let slicedArray1 = arr[0..<mid].map{Array($0[0..<mid])}
    sliceAndCompress(slicedArray1)
    let slicedArray2 = arr[0..<mid].map{Array($0[mid...])}
    sliceAndCompress(slicedArray2)
    let slicedArray3 = arr[mid...].map{Array($0[0..<mid])}
    sliceAndCompress(slicedArray3)
    let slicedArray4 = arr[mid...].map{Array($0[mid...])}
    sliceAndCompress(slicedArray4)
}