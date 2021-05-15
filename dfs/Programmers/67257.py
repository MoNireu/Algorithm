maxResult = 0


def calc(op, num1, num2):
    answer = 0
    if (op == '*'):
        answer = num1 * num2
    elif (op == '+'):
        answer = num1 + num2
    else:
        answer = num1 - num2
    return answer


def dfs(opIdx, opUniqueList, opList, numList):
    global maxResult

    op = opUniqueList[opIdx]

    while (op in opList):
        idx = opList.index(op)
        calcResult = calc(op, numList[idx], numList[idx + 1])
        numList[idx] = calcResult
        del opList[idx]
        del numList[idx + 1]

    del opUniqueList[opIdx]

    if not opUniqueList:
        if (abs(numList[0]) > maxResult):
            maxResult = abs(numList[0])
        return

    for i in range(len(opUniqueList)):
        dfs(i, opUniqueList[:], opList[:], numList[:])
        
    return


def solution(expression):
    answer = 0
    num = ""
    numList = []
    numListOrigin = []
    opList = []
    opListOrigin = []
    opSet = set()
    opUniqueList = []

    for c in expression:
        if (c >= '0' and c <= '9'):
            num += c
        else:
            opSet.add(c)
            opList.append(c)
            numList.append(int(num))
            num = ""
    numList.append(int(num))


    opUniqueList = list(opSet)
    numListOrigin = numList[:]
    opListOrigin = opList[:]

    for i in range(len(opUniqueList)):
        dfs(i, opUniqueList[:], opList[:], numList[:])


    answer = maxResult
    print(answer)
    return answer
