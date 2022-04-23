// https://programmers.co.kr/learn/courses/30/lessons/92341
// 주차 요금 계산

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var answer: [Int] = []
    var totalTimes: [String: Int] = [:]
    var lastInTimes: [String: String?] = [:]
    
    for record in records {
        let splitedRecord = record.components(separatedBy: " ")
        let time = splitedRecord[0]
        let car = splitedRecord[1]
        let status = splitedRecord[2]
        
        switch status {
        case "IN":
            lastInTimes[car] = time
            if totalTimes[car] == nil {
                totalTimes[car] = 0
            }
            break
        case "OUT":
            let stayTime = calcStayTime(inTimeString: lastInTimes[car]!!, outTimeString: time)
            lastInTimes[car]! = nil
            totalTimes[car]! += stayTime
            break
        default:
            break
        }
    }
    
    let baseTime = fees[0]
    let baseFee = fees[1]
    let unitTime = fees[2]
    let unitFee = fees[3]
    
    for car in totalTimes.keys.sorted() {
        if let lastInTime = lastInTimes[car] {
            if let lastInTime = lastInTime {
                let stayTime = calcStayTime(inTimeString: lastInTime, outTimeString: "23:59")
                totalTimes[car]! += stayTime
            }
        }
        
        var totalFee = totalTimes[car]! - baseTime
        if totalFee <= 0 {
            answer.append(baseFee)
        }
        else {
            totalFee = Int(ceil(Float(totalFee) / Float(unitTime))) * unitFee + baseFee
            answer.append(totalFee)
        }
    }
    
    return answer
}

func calcStayTime(inTimeString: String, outTimeString: String) -> Int {
    let inTimeHour = Int(inTimeString.components(separatedBy: ":")[0])!
    let inTimeMinute = Int(inTimeString.components(separatedBy: ":")[1])!
    let inTime = inTimeHour * 60 + inTimeMinute
    
    let outTimeHour = Int(outTimeString.components(separatedBy: ":")[0])!
    let outTimeMinute = Int(outTimeString.components(separatedBy: ":")[1])!
    let outTime = outTimeHour * 60 + outTimeMinute
    
    return outTime - inTime
}
