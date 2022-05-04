// https://programmers.co.kr/learn/courses/30/lessons/64064
// 불량 사용자

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var matchList: [[String]] = []
    for string in banned_id {
        matchList.append([])
        let filteredUserIdList = user_id.filter{$0.count == string.count}
        for filteredUserId in filteredUserIdList {
            var charCount = 0
            for idx in 0..<filteredUserId.count {
                if string[string.index(string.startIndex, offsetBy: idx)] == filteredUserId[filteredUserId.index(filteredUserId.startIndex, offsetBy: idx)] ||
                    string[string.index(string.startIndex, offsetBy: idx)] == "*" {
                    charCount += 1
                }
            }
            if charCount == string.count { matchList[matchList.count-1].append(filteredUserId) }
        }
    }
    var combinationResult = Set<Set<String>>()
    combination(matchList, Set(), [], &combinationResult)
    
    return combinationResult.count
}

func combination(_ matchList: [[String]], _ used: Set<String>, _ current: Set<String>, _ result: inout Set<Set<String>>) {
    if current.count == matchList.count {
        result.insert(current)
        return
    }
    
    var _current = current
    var _used = used
    
    for id in matchList[current.count] {
        if !used.contains(id) {
            _current.insert(id)
            _used.insert(id)
            combination(matchList, _used, _current, &result)
            _current = current
            _used = used
        }
    }
    return
}