# https://www.acmicpc.net/problem/15591

n, q = map(int, input().split())

# [0]: video
# [1]: distance
videoNetwork = list(list() for _ in range(n + 1))


for _ in range(n-1):
	firstVideo, secondVideo, distance = map(int, input().split())
	videoNetwork[firstVideo].append([secondVideo, distance])
	videoNetwork[secondVideo].append([firstVideo, distance])

# [0]: queryDistance
# [1]: startVideo
searchQueryList = list()
for _ in range(q):
	k, v = map(int, input().split())
	searchQueryList.append([k,v])


for searchQuery in searchQueryList:
	queryDistance = searchQuery[0]
	startVideo = searchQuery[1]
	searchHistory = list(False for _ in range(n+1))
	totalVideo = 0

	searchQueue = [startVideo]
	while searchQueue:
		currentVideo = searchQueue.pop(0)
		searchHistory[currentVideo] = True
		for connectedInfo in videoNetwork[currentVideo]:
			connectedVideo = connectedInfo[0]
			connectedDistance = connectedInfo[1]
			if (not searchHistory[connectedVideo]) and (connectedDistance >= queryDistance):
				searchQueue.append(connectedVideo)
				totalVideo += 1

	print(totalVideo)
