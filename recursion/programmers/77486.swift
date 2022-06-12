// https://programmers.co.kr/learn/courses/30/lessons/77486
// 다단계 칫솔 판매

import Foundation

var organizationChart = [String : String]()
var totalIncome = [String : Int]()

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    
    for i in 0..<enroll.count {
        organizationChart[enroll[i]] = referral[i]
        totalIncome[enroll[i]] = 0
    }
    
    for i in 0..<seller.count {
        distribute(income: amount[i] * 100, from: seller[i])
    }
    
    var result = [Int]()
    for enroll in enroll {
        result.append(totalIncome[enroll]!)
    }
    
    return result
}

func distribute(income: Int, from: String) {
    if from == "-" { return }
    
    let distributeAmount = Int(Float(income) * 0.1)
    
    if distributeAmount < 1 {
        totalIncome[from]! += income
        return
    }
    
    let finalIncome = income - distributeAmount
    
    totalIncome[from]! += finalIncome
    let to = organizationChart[from]!
    
    distribute(income: Int(Float(income) * 0.1), from: to)
    return
}