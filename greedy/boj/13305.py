answer = 0
n = int(input())

cityDistance = list(map(int, input().split()))
gasCost = list(map(int, input().split()))
gasCost.remove(gasCost[-1])

selectedCostIndexList = [0]
for i in range(len(gasCost)):
    if gasCost[i] < gasCost[selectedCostIndexList[-1]]:
        selectedCostIndexList.append(i)


for index in range(len(selectedCostIndexList)):
    currentCostIndex = selectedCostIndexList[index]
    if index == len(selectedCostIndexList)-1:
        answer += gasCost[currentCostIndex] * sum(cityDistance[currentCostIndex:])
    else:
        nextCostIndex = selectedCostIndexList[index+1]
        answer += gasCost[currentCostIndex] * sum(cityDistance[currentCostIndex:nextCostIndex])
print(answer) 