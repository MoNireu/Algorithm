'''
각각의 옷 + 1
(1을 더하는 이유는 해당 옷을 안입은 경우)

최종 결과에서 모든 옷을 안입는 경우 1을 뻄.
'''

def solution(clothes):
      
    answer = 1
    
    hash = {}
    
    for cloth in clothes:
        if(cloth[1] not in hash.keys()):
            hash[cloth[1]] = list()
        hash[cloth[1]].append(cloth[0])
    
    
    for key in hash.keys():
        answer *= len(hash[key]) + 1    
    
    
    return answer - 1

