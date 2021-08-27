'''
풀이는 다음과 같다.

처음에 mid 시간을 대충 정한다.
(아래 코드는 best(1초)와 worst(최대시간 * 인원수)의 사이값을 구했다.)

이후 mid 시간동안 처리할 수 있는 인원을 구한다.

만약 처리할 수 있는 인원의 수가 적을 경우: 시간을 더 늘려본다.
만약 처리할 수 있는 인원의 수가 많을 경우: 시간을 줄여본다.

'''

def solution(n, times):
    answer = 2147483647
    
    left = 1
    right = times[-1] * n
    
    while(left < right):
        mid = (left + right) // 2
        
        total = 0
        for time in times:
            total += mid // time
        
        if total >= n:
            right = mid
        else:
            left = mid + 1
            
    return left
