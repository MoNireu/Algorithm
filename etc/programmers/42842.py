def solution(brown, yellow):
    
    answer = []
    
    sum = brown + yellow
    widths = []
    heights = []
    
    for i in range(3, int(sum**(1/2))+1):
        if sum % i == 0:
            heights.append(i)
            widths.append(int(sum / i))
    
    for i, w in enumerate(widths):
        yellowHeight = heights[i] - 2
        yellowWidth = yellow / yellowHeight
        
        if yellowWidth + 2 == widths[i]:
            answer.append(widths[i])
            answer.append(heights[i])
            return answer
