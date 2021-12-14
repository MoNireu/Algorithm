n = int(input())

inputs = list()
inputs.append(0)

for _ in range(n):
	inputs.append(int(input()))

"""
(A) dp[i][0] = 1계단 전에서 왔지만, 앞으로는 1계단 전진이 불가능한 계단.
(B) dp[i][1] = 1계단 전에서 왔지만, 앞으로 1계단 전진이 가능한 계단
(C) dp[i][1] = 2계단 전에와서 모든것이 허용되는 계단.
"""
dp = [[0, 0, 0] for _ in range(n+1)]
dp[1][0] = inputs[1]
dp[1][1] = inputs[1]
dp[1][2] = inputs[1]


for i in range(2, n+1):
	# (A)와 같은 이유에 따라 1계단 전에서 이미 1계단을 움진인 경우를 가져온다.
	dp[i][0] = dp[i-1][1] + inputs[i]
	# (B)와 같은 이유에 따라 1계단 전에서 2계단을 움직인 경우를 가져온다.
	dp[i][1] = dp[i-1][2] + inputs[i]
	# (C)와 같은 이유에 따라 2계단전의 모든 값이 허용된다. 이 중 최대값을 가져온다.
	dp[i][1] = max(dp[i-2]) + inputs[i]

print(max(dp[-1]))