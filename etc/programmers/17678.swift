// https://programmers.co.kr/learn/courses/30/lessons/17678
// [1차] 셔틀버스
import Foundation


func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var crewTimes = timetable.sorted().map{timeToMinute($0)}
    var busMinute = 9 * 60
    for _ in 1..<n {
        var crewCount = 0
        var capacity = m
        for crewMinute in crewTimes {
            if crewMinute <= busMinute {
                crewCount += 1
                capacity -= 1
            }
            else {
                break
            }
            if capacity == 0 { break}
        }
        crewTimes = Array(crewTimes[crewCount...])
        busMinute += t
    }
    
    let lastCrewIndex: Int = {
        for i in 0..<crewTimes.count {
            if crewTimes[i] > busMinute {
                return i - 1
            }
        }
        return crewTimes.count - 1
    }()
    
    if lastCrewIndex < 0 {
        crewTimes = []
    }
    else {
        crewTimes = Array(crewTimes[0...min(m-1, lastCrewIndex)])
    }
    
    print(busMinute, crewTimes)
    
    var answer = ""
    if crewTimes.count < m {
        answer = minuteToTime(busMinute)
    }
    else {
        for i in (1..<crewTimes.count).reversed() {
            if crewTimes[i] != crewTimes[i-1] {
                return minuteToTime(crewTimes[i] - 1)
            }
        }
        return minuteToTime(crewTimes[0] - 1)
    }
    
    return answer
}

func timeToMinute(_ time: String) -> Int {
    let hourStartIdx = time.startIndex
    let hourEndIdx = time.index(time.startIndex, offsetBy: 1)
    let minuteStartIdx = time.index(time.startIndex, offsetBy: 3)
    let minuteEndIdx = time.index(time.startIndex, offsetBy: 4)
    
    let hour = Int(time[hourStartIdx...hourEndIdx])!
    let minute = Int(time[minuteStartIdx...minuteEndIdx])!
    
    return hour * 60 + minute
}

func minuteToTime(_ minute: Int) -> String {
    let timeHour = minute / 60
    let timeMinute = minute % 60
    
    return String(format: "%02d", timeHour) + ":" + String(format: "%02d", timeMinute)
}