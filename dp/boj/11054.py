n = int(input())

numList = list(map(int,input().split()))
reversedNumList = list(reversed(numList))

dpAsc = [1 for _ in range(n)]
dpDes = [1 for _ in range(n)]


    
for i in range(n):
    for j in range(i):
        if numList[i] > numList[j]:
            dpAsc[i] = max(dpAsc[j] + 1, dpAsc[i])

        if reversedNumList[i] > reversedNumList[j]:
            dpDes[i] = max(dpDes[j] + 1, dpDes[i])

answerList = []
dpDes.reverse()

for i in range(n):
    ascMax = max(dpAsc[:i+1])
    desMax = max(dpDes[i:])
    answerList.append(ascMax + desMax)

print(max(answerList)-1)