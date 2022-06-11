// https://programmers.co.kr/learn/courses/30/lessons/49994
// 방문 길이

import Foundation

struct Position: Hashable {
    let x: Int
    let y: Int
}

struct History: Hashable, Equatable {
    static func == (lhs: History, rhs: History) -> Bool {
        return lhs.from.x == rhs.from.x &&
        lhs.from.y == rhs.from.y &&
        lhs.to.x == rhs.to.x &&
        lhs.to.y == rhs.to.y
    }
    
    let from: Position
    let to: Position
}

let directions = ["U": Position(x: 0, y: 1),
                  "D": Position(x: 0, y: -1),
                  "L": Position(x: -1, y: 0),
                  "R": Position(x: 1, y: 0)]

func solution(_ dirs:String) -> Int {
    var currentPosition = Position(x: 0, y: 0)
    var history = Set<History>()
    
    for dir in dirs {
        let nextPosition: Position = {
            let nextX = currentPosition.x + directions[String(dir)]!.x
            let nextY = currentPosition.y + directions[String(dir)]!.y
            
            return Position(x: nextX, y: nextY)
        }()
        
        guard !isPositionOutOfRange(nextPosition) else { continue }
        
        history.insert(History(from: currentPosition, to: nextPosition))
        history.insert(History(from: nextPosition, to: currentPosition))
        currentPosition = nextPosition
    }
    
    for history in history {
        print(history)
    }
    
    return history.count / 2
}

func isPositionOutOfRange(_ position: Position) -> Bool {
    return position.x > 5 || position.x < -5 || position.y > 5 || position.y < -5
}