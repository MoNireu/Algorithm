# 와인을 꼭 1칸 또는 2칸만 움직일 수 있는 것이 아니라 여러칸 건너뛸수 있다는 것이 포인트.

n = int(input())

wineAmountList = []
for _ in range(n):
    wineAmountList.append(int(input()))

beforeTwo = [0, 0]
beforeOne = [0, 0]
current = [0, 0]

for index in range(len(wineAmountList)):
    currentWine = wineAmountList[index]
    current[1] = max(beforeTwo) + currentWine
    current[0] = max(beforeTwo[1], beforeOne[1]) + currentWine
    beforeTwo[0] = max(beforeOne[0], beforeTwo[0])
    beforeTwo[1] = max(beforeOne[1], beforeTwo[1])
    beforeOne = current[:]
print(max(beforeTwo + beforeOne))
