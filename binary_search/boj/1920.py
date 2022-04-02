def binSearch(listToSearch, num):
	left = 0
	right = len(listToSearch)-1
	mid = (right + left) // 2
	resultIndex = -1

	while left <= right:
		if listToSearch[mid] < num:
			left = mid + 1
			mid = (right + left) // 2
		elif listToSearch[mid] > num: 
			right = mid - 1
			mid = (right + left) // 2
		else: # listToSearch[mid] == num: 
			resultIndex = mid
			break

	return resultIndex



n = int(input())
nList = list(map(int, input().split()))

nList.sort()

m = int(input())
mList = list(map(int, input().split()))

for mNum in mList:
	if binSearch(nList, mNum) == -1:
		print(0)
	else:
		print(1)



