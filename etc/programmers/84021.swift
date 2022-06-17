// https://programmers.co.kr/learn/courses/30/lessons/84021
// 퍼즐 조각 채우기

import Foundation

typealias BlockShape = [[Int]]


enum BoardType {
    case game
    case table
}

struct Position: Hashable {
    let row: Int
    let col: Int
}

var totalGameSearchHistory = Set<Position>()
var totalTableSearchHistory = Set<Position>()

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    var answer = 0
    var gameBoardBlockShapes = [BlockShape]()
    var tableBlockShapes = [BlockShape]()
    
    for row in 0..<game_board.count {
        for col in 0..<game_board.count {
            // search game_board
            if game_board[row][col] == 0 &&
                !totalGameSearchHistory.contains(Position(row: row, col: col)) {
                let blockShape = getShape(board: game_board,
                                          position: Position(row: row, col: col),
                                          boardType: .game)
                gameBoardBlockShapes.append(blockShape)
            }
            
            // search table
            if table[row][col] == 1 &&
                !totalTableSearchHistory.contains(Position(row: row, col: col)) {
                let blockShape = getShape(board: table,
                                          position: Position(row: row, col: col),
                                          boardType: .table)
                tableBlockShapes.append(blockShape)
            }
        }
    }
    
    
    for gameBoardBlockShape in gameBoardBlockShapes {
        var blockFound = false
        for (index, tableBlockShape) in tableBlockShapes.enumerated() {
            var rotatedTableBlockShape = tableBlockShape
            for _ in 0..<4 {
                rotatedTableBlockShape = rotate(shape: rotatedTableBlockShape)
                if gameBoardBlockShape == rotatedTableBlockShape {
                    answer += rotatedTableBlockShape.flatMap{ $0.filter{ $0 == 1}}.count
                    blockFound = true
                    tableBlockShapes.remove(at: index)
                    break
                }
            }
            if blockFound { break }
        }
    }
    
    return answer
}

func getShape(board: BlockShape, position: Position, boardType: BoardType) -> BlockShape {
    var minRow = Int.max
    var maxRow = Int.min
    var minCol = Int.max
    var maxCol = Int.min
    var positionSearchHistory = Set<Position>()
    
    let searchPresets = [
        Position(row: 1, col: 0),
        Position(row: -1, col: 0),
        Position(row: 0, col: 1),
        Position(row: 0, col: -1),
    ]
    
    var queue = [Position]()
    queue.append(position)
    
    
    while !queue.isEmpty {
        let currentPosition = queue.removeFirst()
        positionSearchHistory.insert(currentPosition)
        minRow = min(minRow, currentPosition.row)
        maxRow = max(maxRow, currentPosition.row)
        minCol = min(minCol, currentPosition.col)
        maxCol = max(maxCol, currentPosition.col)
        
        for searchPreset in searchPresets {
            let nextRow = currentPosition.row - searchPreset.row
            let nextCol = currentPosition.col - searchPreset.col
            
            guard nextRow >= 0 && nextRow < board.count &&
                    nextCol >= 0 && nextCol < board.count else { continue }
            
            switch boardType {
            case .game:
                guard board[nextRow][nextCol] == 0 else { continue }
            case .table:
                guard board[nextRow][nextCol] == 1 else { continue }
            }
            
            let nextPosition = Position(row: nextRow, col: nextCol)
            guard !positionSearchHistory.contains(nextPosition) else { continue }
            queue.append(nextPosition)
        }
    }
    
    switch boardType {
    case .game:
        totalGameSearchHistory = totalGameSearchHistory.union(positionSearchHistory)
    case .table:
        totalTableSearchHistory = totalTableSearchHistory.union(positionSearchHistory)
    }
    
    let rowLength = maxRow - minRow + 1
    let colLength = maxCol - minCol + 1
    var blockShape = Array(repeating: Array(repeating: 0, count: colLength), count: rowLength)
    for position in positionSearchHistory {
        blockShape[position.row - minRow][position.col - minCol] = 1
    }
    
    return blockShape
}

func rotate(shape: [[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: shape.count), count: shape[0].count)
    
    for i in 0..<shape.count {
        for j in 0..<shape[i].count {
            result[j][shape.count - i - 1] = shape[i][j]
        }
    }
    
    return result
}