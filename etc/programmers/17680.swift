// https://programmers.co.kr/learn/courses/30/lessons/17680
// 캐시

var historyList = [String]()
var historySet = Set<String>()
var answer = 0

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    for city in cities {
        addCache(city.lowercased(), cacheSize: cacheSize)
    }
    
    return answer
}

func addCache(_ city: String, cacheSize: Int) {
    guard cacheSize != 0 else {answer += 5; return}
    if historySet.contains(city) {
        historyList.remove(at: historyList.firstIndex(of: city)!)
        historyList.append(city)
        answer += 1
    }
    else {
        if historyList.count >= cacheSize {
            let remove = historyList.removeFirst()
            historySet.remove(remove)
        }
        historyList.append(city)
        historySet.insert(city)
        answer += 5
    }
}