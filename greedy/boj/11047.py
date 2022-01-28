n, k = map(int, input().split())

inputList = list()
for _ in range(n):
    inputList.append(int(input()))


answer = 0
for value in reversed(inputList):
    if value <= k:
        answer += (k // value)
        k %= value

    if value == 0:
        break

print(answer)


