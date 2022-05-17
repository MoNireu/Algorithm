// https://programmers.co.kr/learn/courses/30/lessons/87946
// 피로도

import Foundation

typealias DungeonType = [[Int]]

var ans = 0
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    for i in 0..<dungeons.count {
        selectDungeons(dungeons: dungeons, selectedIndex: Set([i]), passedIndex: Set([]), currentFatigue: k - dungeons[i][1])
    }
    
    return ans
}

func selectDungeons(dungeons: DungeonType, selectedIndex: Set<Int>, passedIndex: Set<Int>, currentFatigue: Int) {
    if selectedIndex.count + passedIndex.count == dungeons.count {
        ans = max(ans, selectedIndex.count)
        return
    }
    
    var nextSelectedIndex = selectedIndex
    var nextpassedIndex = passedIndex
    
    for i in 0..<dungeons.count {
        if !selectedIndex.contains(i) && !passedIndex.contains(i) {
            if dungeons[i][0] <= currentFatigue {
                nextSelectedIndex.insert(i)
                selectDungeons(dungeons: dungeons, selectedIndex: nextSelectedIndex, passedIndex: passedIndex,currentFatigue: currentFatigue - dungeons[i][1])
                nextSelectedIndex = selectedIndex
            }
            else {
                nextpassedIndex.insert(i)
                selectDungeons(dungeons: dungeons, selectedIndex: selectedIndex, passedIndex: nextpassedIndex, currentFatigue: currentFatigue)
                nextpassedIndex = passedIndex
            }
        }
    }
    return
}