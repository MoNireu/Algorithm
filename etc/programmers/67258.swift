// https://programmers.co.kr/learn/courses/30/lessons/67258
// [카카오 인턴] 보석 쇼핑

import Foundation

func solution(_ gems:[String]) -> [Int] {
    var uniqueGems = Set<String>(gems)
    var searchStatus = [String: Int]()
    var indexStatus = Array(repeating: false, count: gems.count)
    var startIdx = 0
    var endIdx = 0
    
    var minLength = gems.count
    var minStartIdx = gems.count - 1
    var minEndIdx = 0
    
    for (index, gem) in gems.enumerated() {
        if let oldGemIndex = searchStatus[gem] {
            indexStatus[oldGemIndex] = false
            if oldGemIndex == startIdx {
                for i in startIdx..<gems.count {
                    if indexStatus[i] == true {
                        startIdx = i
                        break
                    }
                }
            }
        }
        indexStatus[index] = true
        searchStatus[gem] = index
        endIdx = index
        
        if searchStatus.count == uniqueGems.count {
            if endIdx - startIdx < minLength {
                minLength = endIdx - startIdx
                minStartIdx = startIdx
                minEndIdx = endIdx
            }
        }
    }
    
    return [minStartIdx+1, minEndIdx+1]
}