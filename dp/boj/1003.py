fibonacciDP = [[1,0], [0,1]]




T = int(input())


for _ in range(T):
	N = int(input())

	if len(fibonacciDP)-1 >= N:
		print(f'{fibonacciDP[N][0]} {fibonacciDP[N][1]}')
	else:
		while(len(fibonacciDP)-1 != N):
			zero = fibonacciDP[-1][0] + fibonacciDP[-2][0]
			one = fibonacciDP[-1][1] + fibonacciDP[-2][1]
			fibonacciDP.append([zero, one])

		print(f'{fibonacciDP[-1][0]} {fibonacciDP[-1][1]}')


