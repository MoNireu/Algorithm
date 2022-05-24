// https://programmers.co.kr/learn/courses/30/lessons/17679
// 프렌즈4블록

import Foundation



var board = [[Character]]()
var totalRemoved = [[Int]]()

func solution(_ m:Int, _ n:Int, _ _board:[String]) -> Int {
    board = _board.map{$0.map{$0}}
    
    
    while true {
        var removed = Set<[Int]>([])
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                if board[i][j] == board[i+1][j] &&
                    board[i][j] == board[i][j+1] &&
                    board[i][j] == board[i+1][j+1] &&
                    board[i][j] != " "{
                    
                    removed.insert([i,j])
                    removed.insert([i+1,j])
                    removed.insert([i,j+1])
                    removed.insert([i+1,j+1])
                }
            }
        }
        
        if removed.isEmpty { break }
        
        fillRemoved(m, n, removed: removed)
        
        totalRemoved.append(contentsOf: removed)
    }
    
    print(totalRemoved.count)
    return totalRemoved.count
}

func fillRemoved(_ m: Int, _ n: Int, removed: Set<[Int]>) {
    for j in 0..<n {
        var stack = [Character]()
        for i in 0..<m {
            if !removed.contains([i,j]) {
                stack.append(board[i][j])
            }
        }
        
        for i in (0..<m).reversed() {
            board[i][j] = stack.isEmpty ? " " : stack.popLast()!
        }
    }
}