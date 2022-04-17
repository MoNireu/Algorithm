// https://programmers.co.kr/learn/courses/30/lessons/17676
// [1차] 추석 트래픽
import Foundation

func solution(_ lines:[String]) -> Int {
    var traffics: [(startTime: Int, endTime: Int)] = []
    for line in lines {
        var seperated = line.components(separatedBy: " ")
        seperated[2].removeLast()
        let duration = Int(Double(seperated[2])! * 1000)
        let endTime = getMiliSecondByTime(seperated[1])
        traffics.append((startTime: endTime - duration + 1, endTime: endTime))
    }
    
    var maxTraffic = 1
    for i in 0..<traffics.count-1 {
        var trafficCount = 1
        for j in i+1..<traffics.count {
            if traffics[i].endTime >= traffics[j].startTime && traffics[i].endTime <= traffics[j].endTime ||
                traffics[i].endTime + 999 >= traffics[j].startTime && traffics[i].endTime + 999 <= traffics[j].endTime ||
                traffics[i].endTime >= traffics[j].startTime && traffics[i].endTime + 999 <= traffics[j].endTime ||
                traffics[i].endTime <= traffics[j].startTime && traffics[i].endTime + 999 >= traffics[j].endTime {
                trafficCount += 1
            }
        }
        maxTraffic = max(maxTraffic, trafficCount)
    }
    return maxTraffic
}

func getMiliSecondByTime(_ timeString: String) -> Int {
    let seperated = timeString.components(separatedBy: ":")
    let hour = Int(seperated[0])! * 60 * 60 * 1000
    let minute = Int(seperated[1])! * 60 * 1000
    let second = Int(Double(seperated[2])! * 1000)
    return hour + minute + second
}

