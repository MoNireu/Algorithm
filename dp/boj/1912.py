n = int(input())

minNum = 0
inputs = list(map(int, input().split()))
dp = [0 for _ in range(n+1)]

answerList = []
for i in range(1, n+1):
    dp[i] = dp[i-1] + inputs[i-1]
    minNum = min(dp[i-1], minNum)
    answerList.append(dp[i] - minNum)

print(max(answerList))