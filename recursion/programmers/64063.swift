// https://programmers.co.kr/learn/courses/30/lessons/64063
// 호텔 방 배정

import Foundation

typealias roomStatusType = [Int64: Int64]
var answer: [Int64] = []
var roomStatus: roomStatusType = [:]

func solution(_ k:Int64, _ room_numbers:[Int64]) -> [Int64] {
    for room_number in room_numbers {
        allocateRoom(room_number)
    }
    return answer
}

func allocateRoom(_ roomNumber: Int64) {
    guard let nextRoomIdx = roomStatus[roomNumber] else {
        answer.append(roomNumber)
        roomStatus[roomNumber] = roomNumber + 1
        return
    }
    allocateRoom(nextRoomIdx)
}