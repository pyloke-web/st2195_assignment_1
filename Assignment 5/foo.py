'''
 Checks whether x is divisible by k.
 '''

def is_divisible_by_k(x, k):
 return x%k == 0 
'''
Store all the integers that are multiples of 2 or 5 or 7 that are lower
or equal to 1000 (excluding doubles)
'''
final = []
for i in range(1,1001):
 if (is_divisible_by_k(i, 2) and  is_divisible_by_k(i, 5) and is_divisible_by_k(i, 7)):
    final.append(i)

'''
Sum all the integers that are multiples of 2 or 5 or 7 that are lower
or equal to 1000 (excluding doubles)
'''
print(sum(final))

