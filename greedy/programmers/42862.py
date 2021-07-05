def solution(n, lost, reserve):
    
    losts = set(lost) - set(reserve)
    reserves = set(reserve) - set(lost)
    
    
    for reserve in reserves:
        beforeStudent = reserve - 1
        nextStudent = reserve + 1
        
        if beforeStudent in losts:
            losts.remove(beforeStudent)
        elif nextStudent in losts:
            losts.remove(nextStudent)
        
    answer = n - len(losts)
    
    return answer
