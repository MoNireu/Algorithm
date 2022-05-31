// https://programmers.co.kr/learn/courses/30/lessons/49993
// 스킬트리

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    for skill_tree in skill_trees {
        var lastSkillIndex = skill_tree.count
        for skill in skill.reversed() {
            var nextSkillIndex = skill_tree.count
            if let skillStringIndex = skill_tree.firstIndex(of: skill)  {
                let skillIndex = skill_tree.distance(from: skill_tree.startIndex, to: skillStringIndex)
                nextSkillIndex = skillIndex
            }
            else { nextSkillIndex = skill_tree.count }
            
            if lastSkillIndex < nextSkillIndex {
                answer -= 1
                break
            }
            lastSkillIndex = nextSkillIndex
        }
        answer += 1
    }
    
    return answer
}