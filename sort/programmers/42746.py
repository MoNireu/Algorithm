def solution(numbers):
    answer = '-'
    
    numbers.sort()
    oneList = list()
    tenList = list()
    hunList = list()
    thoList = list()
    for number in numbers:
        if number < 10:
            oneList.append(number)
        elif number < 100:
            tenList.append(number)
        elif number < 1000:
            hunList.append(number)
        elif number < 10000:
            thoList.append(number)

    while(oneList or tenList or hunList or thoList):
        maxList = [-1, -1, -1, -1]
        
        if oneList:
            maxList[0] = oneList[-1]
        if tenList:
            maxList[1] = tenList[-1]
        if hunList:
            maxList[2] = hunList[-1]
        if thoList:
            maxList[3] = thoList[-1]
        
        oneComp = maxList[0]*1000 + maxList[0]*100 + maxList[0]*10 + maxList[0]
        tenComp = maxList[1]*100 + (maxList[1] // 10)*10 + (maxList[1] // 10)
        hunComp = maxList[2]*10 + (maxList[2] // 100)
        thoComp = maxList[3]
        
        compList = [oneComp, tenComp, hunComp, thoComp]
        maxNum = max(compList)
        maxIdxs = list()
        for i, comp in enumerate(compList):
            if comp == maxNum: maxIdxs.append(i)
        
        maxIdx = 0
        if len(maxIdxs) == 1:
            maxIdx = maxIdxs[0]
        else:
            biggest = -1
            for idx in maxIdxs:
                if maxList[idx] % 10 > biggest:
                    biggest = maxList[idx] % 10
                    maxIdx = idx
        
        if maxIdx == 3:
            answer += str(thoList[-1])
            del thoList[-1]
        elif maxIdx == 2:
            answer += str(hunList[-1])
            del hunList[-1]
        elif maxIdx == 1:
            answer += str(tenList[-1])
            del tenList[-1]
        elif maxIdx == 0:
            if len(answer) <= 1:
                answer += str(oneList[-1])
            elif answer[1] != '0' or maxList[0] != 0:
                answer += str(oneList[-1])
            del oneList[-1]
            
        
    
    return answer[1:]
