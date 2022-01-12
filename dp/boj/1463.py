def divdeBy(value, num):
		if num % value == 0:
			return (num / value)
		else:
			return num

n = int(input())

if n == 1:
	print(0)
else:
	dpSet = set()
	dpSet.add(n)
	cnt = 0

	while True:
		cnt += 1

		dpTmpSet = set()
		for val in dpSet:
			dpTmpSet.add(divdeBy(3, val))
			dpTmpSet.add(divdeBy(2, val))
			dpTmpSet.add(val-1)

		dpSet = dpTmpSet - dpSet
		print(len(dpSet))

		if 1 in dpSet:
			break

	print(cnt)
