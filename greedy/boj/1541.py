n = input()

numList = []
minusIndexList = []

num = 0
for value in n:
    if value >= '0' and value <= '9':
        num = num * 10 + int(value)
    else:
        numList.append(num)
        num = 0
        if value == '-':
            minusIndexList.append(len(numList)-1)
numList.append(num)

answerList = []

for i in range(len(minusIndexList)-1, -1, -1):
    minusIndex = minusIndexList[i]
    answerList.append(sum(numList[minusIndex+1:]) * -1)
    numList = numList[:minusIndex+1]
answerList.append(sum(numList))

print(sum(answerList))





