// https://programmers.co.kr/learn/courses/30/lessons/72412
// 순위 검색

import Foundation

typealias solutionType = [String: [Int]]
func solution(_ info:[String], _ query:[String]) -> [Int] {
    var answer: [Int] = []
    var solutionData: solutionType = [:]
    
    for value in info {
        let seperated = value.components(separatedBy: " ")
        putValues(&solutionData, seperated, 0)
    }
    
    for key in solutionData.keys {
        solutionData[key] = solutionData[key]?.sorted()
    }
    
    for value in query {
        let seperated = value.replacingOccurrences(of: "and ", with: "").components(separatedBy: " ")
        let score = Int(seperated[4])!
        let queryResults = solutionData[seperated[0...3].joined()] ?? []
        
        let matchAmount = binarySearch(score, from: queryResults)
        answer.append(matchAmount)
    }
    return answer
}

func putValues(_ data: inout solutionType, _ keywords: [String], _ index: Int) {
    if index == 4 {
        if data[keywords[0...3].joined()] == nil {
            data[keywords[0...3].joined()] = []
        }
        data[keywords[0...3].joined()]!.append(Int(keywords[4])!)
        return
    }
    putValues(&data, keywords, index+1)
    var keywords = keywords
    keywords[index] = "-"
    putValues(&data, keywords, index+1)
    return
}

func binarySearch(_ find: Int, from: [Int]) -> Int {
    guard !from.isEmpty else { return 0 }
    var left = 0
    var right = from.count - 1
    while left <= right {
        let middle = (left + right) / 2
        if from[middle] < find {
            left = middle + 1
        }
        else {
            right = middle - 1
        }
    }
    return from.count - left
}