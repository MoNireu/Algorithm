// https://programmers.co.kr/learn/courses/30/lessons/42888
// 오픈채팅방

import Foundation

func solution(_ record:[String]) -> [String] {
    var answer: [String] = []
    var user: [String : String] = [:]
    
    for log in record {
        let logInfoList = log.components(separatedBy: " ")
        let command = logInfoList[0]
        let userUid = logInfoList[1]
        if command == "Enter" || command == "Change" {
            let userName = logInfoList[2]
            user[userUid] = userName
        }
    }
    
    for log in record {
        let logInfoList = log.components(separatedBy: " ")
        let command = logInfoList[0]
        let userUid = logInfoList[1]
        
        switch command {
        case "Enter":
            answer.append(String("\(user[userUid]!)님이 들어왔습니다."))
            break
        case "Leave":
            answer.append(String("\(user[userUid]!)님이 나갔습니다."))
            break
        default:
            break
        }
    }
    return answer
}

let record = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]
print(solution(record))
