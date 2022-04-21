// https://programmers.co.kr/learn/courses/30/lessons/77485
// 행렬 테두리 회전하기

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var answer: [Int] = []
    var board: [[Int]] = []
    for row in 0..<rows {
        var rowElement: [Int] = []
        for column in 0..<columns {
            rowElement.append(row * columns + column + 1)
        }
        board.append(rowElement)
    }


    // 회전
    for query in queries {
        let topRow = query[0]-1
        let topCol = query[1]-1
        let botRow = query[2]-1
        let botCol = query[3]-1
        let hold = board[topRow][topCol]
        var minNum = hold
        
        // 좌측 움직이기
        for idx in (topRow...botRow-1) {
            minNum = min(minNum, board[idx + 1][topCol])
            board[idx][topCol] = board[idx + 1][topCol]
        }

        // 하단 움직이기
        for idx in (topCol...botCol-1) {
            minNum = min(minNum, board[botRow][idx + 1])
            board[botRow][idx] = board[botRow][idx + 1]
        }
        
        // 우측 움직이기
        for idx in (topRow+1...botRow).reversed() {
            minNum = min(minNum, board[idx - 1][botCol])
            board[idx][botCol] = board[idx - 1][botCol]
        }
        
        // 상단 움직이기
        for idx in (topCol+1...botCol).reversed() {
            minNum = min(minNum, board[topRow][idx - 1])
            board[topRow][idx] = board[topRow][idx - 1]
        }

        board[topRow][topCol + 1] = hold

        answer.append(minNum)
    }
    return answer
}
