n = int(input())

inputList = [] # [strat, end]

answer = 0

for i in range(n):
    start, end = map(int, input().split())
    inputList.append([start, end])

inputList = sorted(inputList, key = lambda x: (x[1], x[0]))

lastTime = 0

for inputs in inputList:
    start = inputs[0]
    end = inputs[1]

    if start >= lastTime:
        lastTime = end
        answer += 1
    
print(answer)