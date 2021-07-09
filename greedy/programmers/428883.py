def solution(number, k):
    answer = ''
    
    bigNum = 0
    bigPos = 0
    
    numList = list(int(num) for num in number)
        
    for i in range(k):
        if int(number[i]) > bigNum:
            bigNum = int(number[i])
            bigPos = i   
            
    k -= bigPos
    
    for i in range(bigPos):
        del numList[0]
    
    
    
    
    return answer
