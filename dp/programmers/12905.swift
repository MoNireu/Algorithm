// https://programmers.co.kr/learn/courses/30/lessons/12905
// 가장 큰 정사각형 찾기

import Foundation

typealias BoardType = [[Int]]

func solution(_ board:[[Int]]) -> Int
{
    if board.count <= 1 {
        return board[0][0]
    }
    
    var board = board
    var maxLenght = 0
    
    for i in 1..<board.count {
        for j in 1..<board[i].count {
            guard board[i][j] == 1 else { continue }
            let across = board[i-1][j-1]
            let left = board[i][j-1]
            let up = board[i-1][j]
            
            board[i][j] = min(across, left, up) + 1
            
            maxLenght = max(maxLenght, board[i][j])
        }
    }

    return maxLenght * maxLenght
}