n, k = map(int, input().split())

inputList = list()
dp = [[0 for _ in range(k+1)] for _ in range(n+1)]
for _ in range(n):
    inputList.append(list(map(int, input().split())))


for i in range(1, n+1):
    for j in range(1, k+1):
        inputWeight = inputList[i-1][0]
        inputValue = inputList[i-1][1]
        if j < inputWeight:
            dp[i][j] = dp[i-1][j]
        else:
            dp[i][j] = max(dp[i-1][j], dp[i-1][j - inputWeight] + inputValue)


print(dp[-1][-1])