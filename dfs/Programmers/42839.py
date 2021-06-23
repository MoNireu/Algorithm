answersSet = set()
def dfs(numList, checkList, cnt, selectedCnt, numString):
    if cnt == selectedCnt:    
        answersSet.add(int(numString))
        return
        
    for i in range(len(numList)):
        if not checkList[i]:
            checkList[i] = True
            dfs(numList, checkList.copy(), cnt, selectedCnt + 1, numString + numList[i])
            checkList[i] = False
    
    return

def isPrime(num):
    if num == 0 or num == 1:
        return False
    for i in range(2, num):
        if num % i == 0:
            return False
    
    return True
    


def solution(numbers):
    answer = 0
    
    numList = list(numbers)
    numList.sort()
    
    checkList = [False for _ in numList]
    for i in range(len(numList)):
        dfs(numList, checkList.copy(), i+1, 0, '')
    
    answersList = list(answersSet)
    
    
    for nums in answersList:
        if isPrime(nums):
            answer += 1
    
    return answer
