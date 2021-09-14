def solution(people, limit):
    answer = 0
    people.sort()
    
    left = 0
    right = len(people) - 1
    
    while left <= right:
        weight = 0
        weight += people[right]
        right -= 1
            
        if weight + people[left] <= limit:
            left += 1
            
        answer += 1
                
                
    return answer
