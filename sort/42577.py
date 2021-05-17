def solution(phone_book):
    answer = True
    
    phone_book.sort()
    
    for i in range(len(phone_book)-1):
        phoneLength = len(phone_book[i])
        if phone_book[i][:phoneLength] == phone_book[i+1][:phoneLength]:
            return False
    
    
    return answer
