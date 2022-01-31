n = int(input())

front = 0
answer = 0
inputList = list(map(int, input().split()))

inputList.sort()
print(inputList)

for inputs in inputList:
    answer += front + inputs
    front += inputs

print(answer)