def solution(prices):
    answer = [0]
    stack = [0]
    length = len(prices)
    
    for i in range(1, length):
        answer.append(0)
        if prices[i] < prices[stack[-1]]:
            for j in stack[::-1]:
                if prices[i] < prices[j]:
                    answer[j] = i - j
                    stack.remove(j)    
                else:
                    break
        
        stack.append(i)
        
    for idx in stack:
        answer[idx] = length - idx - 1
            
    
    return answer
