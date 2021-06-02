import heapq

def solution(jobs):
    answer = 0
    time = 0
    durations = [0]
    
    
    jobsT = list()
    tmpList = list()
    isFinding = False
    
    
    
    for i in range(0, len(jobs)):
        jobsT.append([jobs[i][1], jobs[i][0]])
        
    
    heapq.heapify(jobs)
    heapq.heapify(jobsT)
    
    while(jobsT):
        pop = heapq.heappop(jobsT)
        reqTime = pop[1]
        durTime = pop[0]
        if reqTime <= time:
            jobs.remove([reqTime, durTime])
            time += durTime
            durations.append(time - reqTime)
            if isFinding:
                for tmp in tmpList:
                    heapq.heappush(jobsT, tmp)
                tmpList = []
                isFinding = False
        else:
            heapq.heappush(jobsT, pop)
            isFinding = True
            tmpList.append(heapq.heappop(jobsT))
            if not jobsT:
                jobsT = tmpList.copy()
                tmpList = []
                pop = heapq.heappop(jobs)
                reqTime = pop[0]
                durTime = pop[1]
                delay = reqTime - time
                jobsT.remove([durTime, reqTime])
                time += (durTime + delay)
                durations.append(durTime)
            
        heapq.heapify(jobs)
        heapq.heapify(jobsT)
    
    answer = int(sum(durations) / (len(durations)-1))
        

    
    return answer
