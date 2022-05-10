// https://programmers.co.kr/learn/courses/30/lessons/12977
// 소수 만들기

import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    
    let sumList = getCombinationSum(nums, Set())
    for sum in sumList {
        if isPrimeNum(number: sum) {
            answer += 1
        }
    }
    
    return answer
}


func getCombinationSum(_ nums: [Int], _ _selected: Set<Int>, _ lastIndex: Int = -1) -> [Int] {
    var selected = _selected
    var sums = [Int]()
    
    if selected.count >= 3 {
        return [selected.reduce(0, +)]
    }
    
    guard lastIndex < nums.count - 1 else { return sums }
    
    for i in lastIndex + 1..<nums.count {
        guard !selected.contains(nums[i]) else { continue }
        selected.insert(nums[i])
        sums.append(contentsOf: getCombinationSum(nums, selected, i))
        selected = _selected
    }
    
    return sums
}

func isPrimeNum(number: Int) -> Bool {
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 { return false }
    }
    return true
}