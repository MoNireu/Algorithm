def solution(bridge_length, weight, truck_weights):
    answer = 0
    
    time = 0
    bridge = list()
    bridgeTime = list()
        
    while(truck_weights):
        if bridgeTime:
            if bridgeTime[0] + bridge_length <= time:
                del bridgeTime[0]
                del bridge[0]
            
        if sum(bridge) + truck_weights[0] <= weight:
            time += 1
            bridge.append(truck_weights[0])
            bridgeTime.append(time)
            del truck_weights[0]
            
        else:
            time = bridgeTime[0] + bridge_length - 1
            del bridge[0]
            del bridgeTime[0]
    
        
    if bridge: answer += bridge_length
    answer += time
    
    
    return answer
