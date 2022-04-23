// https://programmers.co.kr/learn/courses/30/lessons/92342
// 양궁대회


import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var results: [[(score:Int, arrowLeft:Int, history:[Int])]] = [] // score, arrowLeft, history
    var baseScoreResult:[(score:Int, arrowLeft:Int, history:[Int])] = []
    let baseLionScore = info[0] == 0 ? 0 : 10
    let basePassHistory = Array(repeating: 0, count: 11)
    let baseShootArrowLeft = n - info[0] - 1
    var baseShootHistory = basePassHistory
    baseShootHistory[0] = n - baseShootArrowLeft
    
    baseScoreResult.append((0 - baseLionScore, n, basePassHistory))
    if baseShootArrowLeft >= 0 {
        baseScoreResult.append((10, baseShootArrowLeft, baseShootHistory))
    }
    results.append(baseScoreResult)
    
    
    for i in 1...10 {
        let score = 10 - i
        let arrowRequired = info[i] + 1
        
        var currentScoreResult: [(score:Int, arrowLeft:Int, history:[Int])] = []
        for previousScoreResult in results[i-1] {
            let previousScore = previousScoreResult.score
            let previousArrowLeft = previousScoreResult.arrowLeft
            let previousHistory = previousScoreResult.history
            
            // pass
            if info[i] != 0 {
                let pass = (previousScore - score, previousArrowLeft, previousHistory)
                currentScoreResult.append(pass)
            }else {
                let pass = (previousScore, previousArrowLeft, previousHistory)
                currentScoreResult.append(pass)
            }
            
            // shoot
            var afterShootHistory = previousHistory
            let arrowLeftAfterShoot = previousArrowLeft - arrowRequired
            
            if arrowLeftAfterShoot < 0 {
                if i == 10 {
                    afterShootHistory[i] = previousArrowLeft
                    let shoot = (previousScore + score, arrowLeftAfterShoot, afterShootHistory)
                    currentScoreResult.append(shoot)
                }
                continue
            }
            afterShootHistory[i] = arrowRequired
            let shoot = (previousScore + score, arrowLeftAfterShoot, afterShootHistory)
            currentScoreResult.append(shoot)
        }
        results.append(currentScoreResult)
    }
    
    let maxResult = results.last?.max(by: { first, second in
        if first.score <= second.score {
            if first.score == second.score {
                for i in (0...10).reversed() {
                    if first.history[i] < second.history[i] { return true }
                    else if first.history[i] > second.history[i] { return false }
                    else {continue}
                }
                return false
            }
            else { return true }
        }
        else { return false }
    })

    if maxResult!.score <= 0 { return [-1] }
    else { return maxResult!.history}
}
