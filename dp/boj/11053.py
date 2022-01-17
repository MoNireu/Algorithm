"""
dp의 각 index는 나보다 앞에 있는 가장 긴 부분 수열의 길이를 저장한다.
"""


n = int(input())

numList = list(map(int,input().split()))

dp = [1 for _ in range(n)]

for i in range(n):
    for j in range(i):
        currentVal = numList[i]
        previousVal = numList[j]
        # currentDp = dp[i]
        # previousDp = dp[j]
        
        if currentVal > previousVal:
            dp[i] = max(dp[j] + 1, dp[i])

print(max(dp))

    
    



