answer = []
complete = False

def dfs(airports, fromAirportName, cnt):
    global answer
    global complete
    
    if fromAirportName not in airports.keys():
        return
    
    if cnt == 0:
        complete = True
        for  airport in airports[fromAirportName]:
            if airport != 'V':
                answer.append(airport)
        print(answer)
        return
    
    toAirports = airports[fromAirportName]
    
    for toAirportIdx in range(len(toAirports)):
        if toAirports[toAirportIdx] != 'V':
            tmp = toAirports[toAirportIdx]
            airports[fromAirportName][toAirportIdx] = 'V'
            # print(airports)
            answer.append(tmp)
            dfs(airports.copy(), tmp, cnt - 1)
            if complete == True:
                return
            answer.pop()
            airports[fromAirportName][toAirportIdx] = tmp
    
    return



def solution(tickets):
    global answer
    cnt = 0
    
    airports = dict()
    
    
    for ticket in tickets:
        if ticket[0] not in airports.keys():
            airports[ticket[0]] = []
        airports[ticket[0]].append(ticket[1])
        cnt += 1
    
    
    for airport in airports.keys():
        airports[airport].sort()
    
    answer.append('ICN')
    
    dfs(airports.copy(), 'ICN', cnt - 1)
    
    return answer
