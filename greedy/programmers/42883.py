def solution(number, k):
    answer = ''
    
    numList = list(number)
    stack = list()
    
    for num in numList:
        while(stack and stack[-1] < num and k > 0):
            stack.pop()
            k -= 1
        
        stack.append(num)
        
    if k > 0:
        answer = ''.join(stack[:-k])
    else:
        answer = ''.join(stack)
    
    return answer
