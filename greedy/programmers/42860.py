def solution(name):
    forward = -1
    backward = -1
    combine = -2
    cursor = 0
    cursor1 = 0
    cursor2 = 0
    
    name = list(name)
    inputString = ['A' for _ in range(len(name))]
    
    if name == inputString: return 0
    
    # forward
    while(name != inputString):
        forward += 1
        alphabetInterval = ord(name[cursor]) - ord(inputString[cursor])
        if alphabetInterval > 13:
            alphabetInterval = 26 - alphabetInterval
            
        inputString[cursor] = name[cursor]
        
        cursor += 1
        forward += alphabetInterval
        
        
    cursor = 0
    inputString = ['A' for _ in range(len(name))]
    
    # backward
    while(name != inputString):
        backward += 1
        alphabetInterval = ord(name[cursor]) - ord(inputString[cursor])
        if alphabetInterval > 13:
            alphabetInterval = 26 - alphabetInterval
            
        inputString[cursor] = name[cursor]
        
        cursor -= 1
        backward += alphabetInterval
        
        
    cursor = 0
    inputString = ['A' for _ in range(len(name))]
    
    #combine
    while(name != inputString):
        combine += 1
        alphabetInterval = ord(name[cursor1]) - ord(inputString[cursor1])
        if alphabetInterval > 13:
            alphabetInterval = 26 - alphabetInterval
            
        inputString[cursor1] = name[cursor1]
        
        cursor1 += 1
        combine += alphabetInterval
        
        #
        combine += 1
        alphabetInterval = ord(name[cursor2]) - ord(inputString[cursor2])
        if alphabetInterval > 13:
            alphabetInterval = 26 - alphabetInterval
            
        inputString[cursor2] = name[cursor2]
        
        cursor2 -= 1
        combine += alphabetInterval
    

    
    return min(forward, backward, combine)
