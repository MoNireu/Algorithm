'''
거리에 따라서 돌들을 제거한다.

이분 탐색에서 돌 사이의 거리 최소값(1)과 돌 사이의 거리 최대값(distance)를 각각 left와 right로 설정한 다음,
탐색을 시작한다.

각 거리마다 돌들을 제거하고
제거한 돌의 개수가 제거 할 돌들의 개수(n) 보다 클 경우
right를 감소시키고
그 반대의 경우 left를 증가시킨다.
'''


def solution(distance, rocks, n):
    answer = 0
    dis = []
    
    rocks.sort()
    rocks.insert(0, 0)
    rocks.append(distance)
    
    left = 1
    right = distance
    
    removedRocks = []
    
    cnt = 0
    
    while(left <= right):
        mid = (right + left) // 2
        
        start = rocks[0]
        removedRocks = []
        
        for rock in rocks[1:]:
            if (rock - start) >= mid:
                start = rock
            else:
                removedRocks.append(rock)
                
                
        if len(removedRocks) > n:
            right = mid - 1
        else:
            left = mid + 1
            if answer < mid:
                answer = mid
            
        cnt += 1

    
    return answer
