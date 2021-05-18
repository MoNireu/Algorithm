def solution(priorities, location):
    answer = 1
    
    lastIdx = len(priorities) - 1
    targetIdx = location
    
    while(True):
        priorityIdx = priorities.index(max(priorities))
        
        if priorityIdx < targetIdx:
            targetIdx -= priorityIdx
        elif priorityIdx > targetIdx:
            targetIdx = (lastIdx + targetIdx + 1) - priorityIdx
        else:
            return answer

        priorities.extend(priorities[:priorityIdx])
        del(priorities[:priorityIdx + 1])
        
        lastIdx -= 1
        targetIdx -= 1
        answer += 1
    
    return answer
