import heapq

def solution(scovilles, K):
    answer = 0
    heapq.heapify(scovilles)
    while(len(scovilles) > 1):
        first = heapq.heappop(scovilles)

        if first >= K:
            break

        second = heapq.heappop(scovilles)

        new = first + (second * 2)
        heapq.heappush(scovilles, new)
        answer += 1
        
    
    if scovilles[0] >= K:
        return answer
    else:
        return -1
