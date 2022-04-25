// https://programmers.co.kr/learn/courses/30/lessons/72411
// 메뉴 리뉴얼

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var answer: [String] = []
    
    let sortedOrders = orders.map({String($0.sorted())}).sorted(by: {$0.count < $1.count})
    
    var courseDic: [String: Set<Int>] = [:]
    
    for i in 0..<sortedOrders.count-1 {
        for j in i+1..<sortedOrders.count {
            var menuSet = ""
            for menu in sortedOrders[i] {
                if sortedOrders[j].contains(menu) {
                    menuSet += String(menu)
                }
            }
            
            guard menuSet.count > 1 else { continue }
            
            var menuNames: [String] = []
            for i in 2...menuSet.count {
                menuNames.append(contentsOf: getCombinations(str: menuSet, currentStr: "", lastIdx: 0, limit: i))
            }
            
            for menuName in menuNames {
                if courseDic[menuName] == nil {
                    courseDic[menuName] = Set<Int>()
                    courseDic[menuName]!.insert(i)
                }
                courseDic[menuName]!.insert(j)
            }
        }
    }
    
    for course in course {
        let filteredCourseKey = courseDic.filter({$0.key.count == course})
        if let maxVal = filteredCourseKey.max(by: {$0.value.count <= $1.value.count})?.value.count {
            let filteredCourseVal = filteredCourseKey.filter({$0.value.count == maxVal})
            answer.append(contentsOf: filteredCourseVal.keys)
        }
    }
    
    return answer.sorted()
}


func getCombinations(str: String, currentStr: String, lastIdx: Int, limit: Int) -> [String] {
    var combinations: [String] = []
    
    guard currentStr.count < limit else {
        combinations.append(currentStr)
        return combinations
    }
    
    guard lastIdx <= str.count - 1 else { return combinations }
    
    for i in lastIdx..<str.count {
        let iString = String(str[str.index(str.startIndex, offsetBy: i)])
        if currentStr.contains(iString) { continue }
        combinations.append(contentsOf: getCombinations(str: str, currentStr: currentStr + iString, lastIdx: i+1, limit: limit))
    }
    
    return combinations
}
