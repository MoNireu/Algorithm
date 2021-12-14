inputList = []


n = int(input())

for i in range(n):
	tmpList = list(map(int, input().split()))
	inputList.append(tmpList)


for i in reversed(range(n-1)):
	targetList = inputList[i]

	for j, v in enumerate(targetList):
		left = v + inputList[i+1][j]
		right = v + inputList[i+1][j+1]
		if left >= right:
			targetList[j] = left
		else:
			targetList[j] = right


print(inputList)
