"""
전깃줄이 교차하지 않게하기 위해 없애야 하는 전기의 최소 갯수 = 전체 전깃줄의 수 - 최대 수열 수
"""

n = int(input())
inputList = []
lineList = []
dp = [1] * n
for _ in range(n):
    inputList.append(list(map(int, input().split())))


inputList = (sorted(inputList, key=lambda x: x[0]))


for inputs in inputList:
    lineList.append(inputs[1])

for i in range(n):
    for j in range(i):
        if lineList[i] > lineList[j]:
            dp[i] = max(dp[j] + 1, dp[i])

print(n - max(dp))