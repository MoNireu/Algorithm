def solution(citations):
    answer = 0
    
    citations.sort()
    citLen = len(citations)
    
    left = 0
    right = citations[-1]
    
    while(left <= right):
        mid = (right + left) // 2
        more = citLen
        less = 0
        
        for i in range(citLen):
            if citations[i] < mid:
                less = i + 1
                more = citLen - less
            elif citations[i] == mid:
                less += 1
                break
            elif citations[i] > mid:
                break
        
        
        if (mid <= more and mid >= less):
            left = mid + 1
            answer = mid
        else:
            right = mid - 1
    
    return answer
